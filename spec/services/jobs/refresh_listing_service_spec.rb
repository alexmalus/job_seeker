# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Jobs::RefreshListingService, :aggregate_failures do
  describe '#run' do
    subject(:result) { Jobs::RefreshListingService.run }

    context 'when the jobs are cached' do
      before { Rails.cache.redis.set 'retrieve_jobs_cache', true }

      it { is_expected.to eq(Jobs::RefreshListingService::REASSURING_MSG) }
    end

    context 'when the jobs are no longer cached' do
      it 'starts retrieving results' do
        expect(JobRetrievalWorker).to receive(:perform_async)

        expect { subject }.to have_broadcasted_turbo_stream_to('feed', action: :replace, target: :feed,
                                                                       partial: 'jobs/feed', locals: { lazy_load: false })

        expect(subject).to eq(Jobs::RefreshListingService::PROCESSING_MSG)
      end
    end
  end
end
