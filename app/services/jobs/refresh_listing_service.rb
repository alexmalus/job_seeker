# frozen_string_literal: true

module Jobs
  # Responsibility to determine whether it is necessary or not to retrieve jobs, as retrieval is an expensive operation.
  # Return a message explaining the result.
  class RefreshListingService
    include JobSeeker::ServiceLoader

    REASSURING_MSG = "You're already up to speed!"
    PROCESSING_MSG = 'Updating the feed..'

    def initialize; end

    def run
      jobs_still_present? ? REASSURING_MSG : start_retrieval
    end

    private

    def jobs_still_present?
      Rails.cache.redis.keys.include?(Jobs::RetrieveInfoService::CACHE_KEY_NAME)
    end

    def start_retrieval
      Turbo::StreamsChannel.broadcast_replace_to :feed, target: :feed,
                                                        partial: 'jobs/feed', locals: { lazy_load: false }
      JobRetrievalWorker.perform_async

      PROCESSING_MSG
    end
  end
end
