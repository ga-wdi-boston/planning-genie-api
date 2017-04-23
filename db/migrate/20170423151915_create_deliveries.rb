class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.string :status
      t.string :date
      t.string :cohort
      t.references :prepper, references: :users
      t.references :reviewer, references: :users
      t.references :user, index: true, foreign_key: true, null: false
      t.references :material, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
