# frozen_string_literal: true

require 'rails_helper'

describe 'Jobs requests' do
  describe 'GET #index' do
    it 'responds with an OK status' do
      get root_path, params: nil

      expect(response).to have_http_status(:ok)
    end
  end
end
