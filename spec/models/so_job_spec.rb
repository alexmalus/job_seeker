# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SoJob do
  describe '#factory' do
    let(:so_job) { build(:so_job) }

    it { is_expected.to be_valid }
  end

  describe '#broadcast' do
    subject { job.broadcast }

    context 'when the job type is SoJob' do
      let(:job) { build(:so_job) }

      it 'broadcasts a received job' do
        expect { subject }.to have_broadcasted_turbo_stream_to('feed', action: :replace, target: "so_id_#{job.id}",
                                                                       partial: 'jobs/job', locals: { job: job })
      end
    end
  end
end
