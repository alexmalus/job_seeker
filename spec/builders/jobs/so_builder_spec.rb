# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Jobs::SoBuilder do
  describe '#build' do
    subject(:result) { Jobs::SoBuilder.build(rss_entry: rss_entry, id: id) }

    context 'with a set of valid inputs' do
      let(:id) { job.id }
      let(:job) { build(:so_job) }

      it 'builds a SO specific job' do
        expect(result.attributes).to eq(job.attributes)
      end
    end
  end
end
