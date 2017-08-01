class ChangeColumnUserForDelivery < ActiveRecord::Migration[5.0]
  def change
    change_column :deliveries, :user_id, :integer, null: true
  end
end
