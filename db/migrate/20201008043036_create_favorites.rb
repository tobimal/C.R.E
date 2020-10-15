class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
    	t.integer :end_user_id, foreign_key: true, null: false
    	t.integer :novel_id, foreign_key: true, null: false

      t.timestamps
       t.index [:end_user_id, :novel_id], unique: true
    end
  end
end
