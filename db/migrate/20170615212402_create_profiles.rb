class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.text :given_name
      t.text :family_name
      t.text :photo_url
      t.text :preferences

      t.references :user,
                   foreign_key: true,
                   null: false,
                   index: { unique: true }

      t.timestamps
    end
  end
end
