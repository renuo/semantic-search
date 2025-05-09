module SemanticSearch
  class IssueHooks < Redmine::Hook::Listener
    def controller_issues_new_after_save(context = {})
      issue = context[:issue]
      schedule_embedding_job(issue.id) if issue.present?
    end

    def controller_issues_edit_after_save(context = {})
      issue = context[:issue]
      schedule_embedding_job(issue.id) if issue.present?
    end

    def controller_journals_edit_post(context = {})
      journal = context[:journal]
      schedule_embedding_job(journal.journalized_id) if journal.present? && journal.journalized_type == 'Issue'
    end

    def controller_journals_new_after_save(context = {})
      journal = context[:journal]
      schedule_embedding_job(journal.journalized_id) if journal.present? && journal.journalized_type == 'Issue'
    end

    def controller_timelog_edit_after_save(context = {})
      time_entry = context[:time_entry]
      schedule_embedding_job(time_entry.issue_id) if time_entry.present? && time_entry.issue_id.present?
    end

    private

    def schedule_embedding_job(issue_id)
      IssueEmbeddingJob.perform_later(issue_id)
    end
  end
end
