class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :gender
      t.text :bio
      t.integer :user_id

      t.timestamps
    end
  end
end
