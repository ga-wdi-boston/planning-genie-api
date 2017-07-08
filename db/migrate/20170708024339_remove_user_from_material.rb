class RemoveUserFromMaterial < ActiveRecord::Migration[5.0]
  def change
    remove_reference :materials, :user, foreign_key: true
  end
end
