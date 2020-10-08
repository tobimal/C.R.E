class CreateSeriesIllusts < ActiveRecord::Migration[5.2]
  def change
    create_table :series_illusts do |t|
    	t.integer :end_user_id
    	t.string :title
    	t.text :introduction
      t.timestamps
    end
  end
end
