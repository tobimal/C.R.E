class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
    	t.integer :end_user_id
    	t.integer :novel_id
    	t.integer :illustration_id
      t.timestamps
    end
  end
end
