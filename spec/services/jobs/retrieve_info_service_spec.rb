# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Jobs::RetrieveInfoService, :aggregate_failures do
  describe '#run' do
    subject(:result) { Jobs::RetrieveInfoService.run(broadcast: broadcast) }

    context 'when the cache does not have any jobs' do
      before { allow_any_instance_of(Jobs::RetrieveInfoService).to receive(:rss_entries) { rss_entries } }
      let(:jobs) { [build(:so_job)] }

      context 'with broadcast set to false' do
        let(:broadcast) { false }

        it 'returns the jobs' do
          expect(subject.collect(&:attributes).sort).to eq(jobs.collect(&:attributes).sort)
        end
      end

      context 'with broadcast set to true' do
        let(:broadcast) { true }
        let(:test_ok) { OpenStruct.new(test: :OK) }

        it 'broadcasts the jobs' do
          allow_any_instance_of(Jobs::RetrieveInfoService).to receive(:broadcast_jobs).and_return(test_ok)

          expect(result).to eq(test_ok)
        end
      end
    end
  end
end
