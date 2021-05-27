# frozen_string_literal: true

module JobViewer
  # Component to help render placeholder jobs.
  # On a high level, enables reusability, while avoiding code smells like shotgun surgery.
  class PlaceholderJob < ViewComponent::Base
    include Turbo::FramesHelper

    attr_reader :id

    def initialize(id:)
      @id = id
      super
    end

    def unique_id
      "so_id_#{id}"
    end
  end
end
