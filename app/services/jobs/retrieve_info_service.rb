# frozen_string_literal: true

module Jobs
  # Responsibility to retrieve needed jobs, either from the Redis cache or from the outside world.
  class RetrieveInfoService
    include JobSeeker::ServiceLoader

    CACHE_KEY_NAME = 'retrieve_jobs_cache'
    CACHE_KEEP_ALIVE = 5.minutes

    def initialize(broadcast: true)
      @broadcast_yn = broadcast
    end

    def run
      retrieve_jobs
    end

    private

    attr_reader :broadcast_yn

    def retrieve_jobs
      Rails.cache.fetch(CACHE_KEY_NAME, expires_in: CACHE_KEEP_ALIVE) do
        broadcast_yn ? broadcast_jobs : jobs
      end
    end

    def broadcast_jobs
      jobs.each(&:broadcast)
    end

    def jobs
      @jobs ||= rss_entries.each_with_index.map { |entry, idx| Jobs::SoBuilder.build(rss_entry: entry, id: idx) }
    end

    def rss_entries
      Jobs::ScrapperGateway.run
    end
  end
end
