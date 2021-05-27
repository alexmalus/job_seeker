# frozen_string_literal: true

module Jobs
  # Rss input coming from StackOverflow (SO).
  class SoBuilder
    include JobSeeker::BuilderLoader

    MAPPED_ATTRIBUTES = %i[author categories published summary title updated url].freeze

    # Convention: rss_entry must quack like a Feedjira::Parser::RSSEntry object (responds to instance_values).
    def initialize(rss_entry:, id:)
      @rss_entry = rss_entry
      @job = SoJob.new(id: id)
    end

    def build
      rss_entry.instance_values.each do |key, val|
        next if MAPPED_ATTRIBUTES.exclude?(key.to_sym)

        @job.send("#{key}=", val)
      end

      @job
    end

    private

    attr_reader :rss_entry
    attr_accessor :job
  end
end
