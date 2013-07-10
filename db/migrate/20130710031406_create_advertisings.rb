class CreateAdvertisings < ActiveRecord::Migration
  def change
    create_table :advertisings do |t|
      t.string :title
      t.text :description
      t.string :status
      t.integer :user_id

      t.timestamps
    end
    add_index :advertisings, :user_id
    add_foreign_key :advertisings, :users
  end
end
