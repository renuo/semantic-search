class SyncEmbeddingsJob < ActiveJob::Base
  queue_as :default

  def perform
    Issue.find_each do |issue|
      IssueEmbeddingJob.perform_later(issue.id)
    end

    Rails.logger.info("=> [SEMANTIC_SEARCH] Scheduled embedding generation for all issues")
  end
end
