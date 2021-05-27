# frozen_string_literal: true

module Jobs
  # This controller's responsibility is to refresh [part of] the page.
  # It does so when the page is accessed for the first time (initial_load), as well as when the user explicitly submits
  #   the form (perform) to refresh the job listing.
  class RefreshController < ApplicationController
    # This controller will never render any layout.
    layout false

    # Ref: https://turbo.hotwire.dev/handbook/frames#cache-benefits-to-lazily-loading-frames
    def initial_load
      @jobs = Job.fetch_jobs(broadcast: false)
    end

    def perform
      flash.now[:notice] = Jobs::RefreshListingService.run
      render_flash
    end
  end
end
