class AddReferenceToPost < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :user, null: false
  end
end
