class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :body
      t.integer :created_by_user

      t.timestamps null: false
    end
  end
end
