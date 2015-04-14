class CreateJoineds < ActiveRecord::Migration
  def change
    create_table :joineds do |t|
      t.references :user, index: true, foreign_key: true
      t.string :idea
      t.string :references

      t.timestamps null: false
    end
  end
end
