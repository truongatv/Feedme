class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :user_id
      t.string :title
      t.string :caption
      t.string :file
      t.datetime :created_at

      t.timestamps
    end
  end
end
