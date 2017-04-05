# frozen_string_literal: true
class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.text :due_date, null: false
      t.text :material_type, null: false
      t.text :name, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
