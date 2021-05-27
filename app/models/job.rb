# frozen_string_literal: true

# PORO class that stores all the SO information, to then display it to the user.
class Job
  include ActiveModel::Model
  # Ref: https://api.rubyonrails.org/classes/ActiveModel/Type.html
  include ActiveModel::Attributes
  include ActiveModel::AttributeMethods
  include Turbo::Broadcastable
  extend ActiveModel::Naming

  attribute :id, :integer

  def self.fetch_jobs(broadcast: true)
    Jobs::RetrieveInfoService.run(broadcast: broadcast)
  end
end
