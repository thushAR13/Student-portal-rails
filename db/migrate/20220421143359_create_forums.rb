class CreateForums < ActiveRecord::Migration[7.0]
  def change
    create_table :forums do |t|
      t.integer :author_id
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
