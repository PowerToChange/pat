class AddDonorEmailToProjectDonations < ActiveRecord::Migration
  def self.up
    add_column :project_donations, :donor_email, :string
  end

  def self.down
    remove_column :project_donations, :donor_email
  end
end
