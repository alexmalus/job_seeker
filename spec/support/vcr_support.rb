VCR.configure do |config|
  config.cassette_library_dir = 'spec/factories/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true
end
