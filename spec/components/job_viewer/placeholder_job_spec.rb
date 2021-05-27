# frozen_string_literal: true

require 'rails_helper'

describe JobViewer::PlaceholderJob, type: :view do
  subject(:component) { described_class.new(id: id) }

  let(:id) { job.id }
  let(:job) { build(:job) }

  context '#rendering' do
    it 'renders the job preview' do
      render(component)

      expect(rendered).to match('animate-pulse')
    end
  end

  context '#unique_id' do
    subject(:result) { component.unique_id }

    let(:expected_value) { "so_id_#{id}" }

    it { is_expected.to eq(expected_value) }
  end
end
