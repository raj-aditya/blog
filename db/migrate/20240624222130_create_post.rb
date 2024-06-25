class CreatePost < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :description
      t.integer :favorites_count

      t.timestamps
    end
  end
end
