# frozen_string_literal: true

module Jobs
  # Responsibility to scrap the SO site for jobs.
  # Return a parsable (should respond to each_with_index) list of results.
  class ScrapperGateway
    RESULT_LIMIT = 10
    SORT_BY_LOC = 'l=Munich%2C+Deutschland'
    SORT_BY_NEWEST = 'sort=p'
    SO_LOOKUP_URL = "https://stackoverflow.com/jobs/feed?#{SORT_BY_LOC}&#{SORT_BY_NEWEST}"

    def self.run
      result = HTTP.get(SO_LOOKUP_URL).to_s

      Feedjira.parse(result).entries.first(RESULT_LIMIT)
    end
  end
end
