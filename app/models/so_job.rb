# frozen_string_literal: true

# PORO class that stores all the SO information, to then display it to the user.
class SoJob < Job
  # Expected in accordance to the Jobs::SoBuilder.
  attribute :author, :string
  attribute :categories, array: true
  attribute :published, :datetime
  attribute :summary, :string
  attribute :title, :string
  attribute :updated, :datetime
  attribute :url, :string

  # Kept at this seam as it contains info about the partial name, as well as uses Action specific logic.
  def broadcast
    # temp, lacking time: with view components, unable to use ActionView::RecordIdentifier.dom_id(self) to
    #   identify the target anymore; the broadcast is sent, however the receiver does nothing with it.
    # the target value looks identical to what is used below, which makes it very strange.
    Turbo::StreamsChannel.broadcast_replace_to 'feed', target: "so_id_#{id}",
                                                       partial: 'jobs/job', locals: { job: self }
  end
end
