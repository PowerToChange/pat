class AddDonorEmailToManualDonations < ActiveRecord::Migration
  def self.up
    add_column :manual_donations, :donor_email, :string
  end

  def self.down
    remove_column :manual_donations, :donor_email, :string
  end
end
