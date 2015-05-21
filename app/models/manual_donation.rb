class ManualDonation < ActiveRecord::Base
  load_mappings
  include Common::Core::Ca::ManualDonation
  STATUSES = self.STATUSES
  LIST_COLUMNS = self.LIST_COLUMNS
  LIST_TYPES = self.LIST_TYPES

  belongs_to :acceptance

  # auto donations (that get dumped from project services) have donor_email in it, so we need to at least respond to the column
  # even if it just returns nil
  def donor_email
  end
end
