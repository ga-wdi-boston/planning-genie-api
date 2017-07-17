class AddLengthToDelivery < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :length, :integer, null: false
  end
end
