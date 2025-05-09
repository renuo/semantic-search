require File.expand_path('../../application_system_test_case', __FILE__)

class SemanticSearchSystemTest < ApplicationSystemTestCase
  fixtures :projects, :users, :roles, :members, :member_roles, :issues, :trackers

  def setup
    @user = User.find(2)
    @role = Role.find(1)
    @role.add_permission!(:use_semantic_search)

    ENV['OPENAI_API_KEY'] = 'test_api_key'

    @issue = Issue.find(1)
    @embedding = IssueEmbedding.create!(
      issue: @issue,
      embedding_vector: [0.1] * 1536,
      content_hash: 'test_hash'
    )

    EmbeddingService.any_instance.stubs(:generate_embedding).returns([0.1] * 1536)

    log_user(@user.login, 'jsmith')
  end

  def teardown
    ENV.delete('OPENAI_API_KEY')
  end

  test "semantic search end-to-end happy path" do
    visit '/semantic_search'

    assert_selector 'h2', text: 'Semantic Search'
    assert_selector 'form#semantic-search-form'

    within '#semantic-search-form' do
      fill_in 'q', with: 'test query about bug issues'
      click_button 'Search'
    end

    assert_selector 'dl#search-results-list'

    assert_selector "dt a[href='/issues/#{@issue.id}']"

    find("dt a[href='/issues/#{@issue.id}']").click

    assert_current_path(%r{/issues/#{@issue.id}}, url: true)
  end

  test "semantic search with empty results" do
    IssueEmbedding.delete_all

    visit '/semantic_search'

    within '#semantic-search-form' do
      fill_in 'q', with: 'query with no results'
      click_button 'Search'
    end

    assert_selector 'p.nodata'
  end

  test "semantic search page is accessible only to authorized users" do
    Capybara.reset_sessions!

    visit '/semantic_search'

    assert_current_path(/\/login/, url: true)
  end
end
