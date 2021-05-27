# frozen_string_literal: true

# Responsibility to start crunching the request to retrieve jobs.
class JobRetrievalWorker
  include Sidekiq::Worker

  def perform(*args)
    Job.fetch_jobs
  end
end
