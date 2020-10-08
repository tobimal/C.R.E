class CreateSeriesNovels < ActiveRecord::Migration[5.2]
  def change
    create_table :series_novels do |t|
    	t.integer :end_user_id
    	t.string :title
    	t.text :introduction
      t.timestamps
    end
  end
end
