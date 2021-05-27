# frozen_string_literal: true

# Main app controller, holding reusable function(s).
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_flash
    render turbo_stream: turbo_stream.update('flash', partial: 'shared/flash')
  end
end
