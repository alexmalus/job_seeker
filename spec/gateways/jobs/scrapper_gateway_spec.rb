# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Jobs::ScrapperGateway do
  describe '#run' do
    subject(:result) { Jobs::ScrapperGateway.run }

    it 'returns parsable (as agreed with its consumers) results', :vcr do
      expect(result).to respond_to(:instance_values)
    end
  end
end
