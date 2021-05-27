# frozen_string_literal: true

require 'rails_helper'

describe 'Jobs::Refresh requests', :aggregate_failures do
  describe 'GET #initial_load' do
    before { allow(Job).to receive(:fetch_jobs) { jobs } }

    let(:jobs) { [build(:so_job)] }

    it 'responds with an OK status and renders the job content' do
      get jobs_initial_load_path, params: nil

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(jobs.first.author)
    end
  end

  describe 'POST #perform' do
    let(:test_ok) { 'It worked!' }

    it 'responds with an OK status and renders the job content' do
      allow_any_instance_of(Jobs::RefreshListingService).to receive(:run).and_return(test_ok)

      post jobs_refresh_path, params: nil

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(test_ok)
    end
  end
end
