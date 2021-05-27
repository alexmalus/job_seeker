# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Job do
  describe '#factory' do
    let(:job) { build(:job) }

    it { is_expected.to be_valid }
  end

  describe '.fetch_jobs', :aggregate_failures do
    context 'independent of the broadcast value' do
      it 'calls relevant service' do
        [true, false].each do |broadcast|
          # What the service does is tested in its own dedicated context.
          expect(Jobs::RetrieveInfoService).to receive(:run)

          Job.fetch_jobs(broadcast: broadcast)
        end
      end
    end
  end
end
