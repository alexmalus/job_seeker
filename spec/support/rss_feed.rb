# frozen_string_literal: true

module RssFeed
  FEEDS = { sample_rss_feed: 'SampleRssFeed.xml' }.freeze

  FEEDS.each do |method, filename|
    define_method(method) { load_sample filename }
  end

  def load_sample(filename)
    File.read("#{File.dirname(__FILE__)}/sample_feeds/#{filename}")
  end
end
