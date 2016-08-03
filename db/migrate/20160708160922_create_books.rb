class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :excerpt
      t.integer :author_id
      t.integer :publisher_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
