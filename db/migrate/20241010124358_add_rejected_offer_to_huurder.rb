class AddRejectedOfferToHuurder < ActiveRecord::Migration[7.1]
  def change
    add_column :huurders, :rejected_offer, :boolean
  end
end
