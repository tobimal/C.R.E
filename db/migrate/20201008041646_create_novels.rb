class CreateNovels < ActiveRecord::Migration[5.2]
  def change
    create_table :novels do |t|
    	t.integer :series_novel_id
    	t.integer :end_user_id
    	t.string :title
    	t.text :body

      t.timestamps
    end
  end
end
