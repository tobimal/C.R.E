class CreateIllustrations < ActiveRecord::Migration[5.2]
  def change
    create_table :illustrations do |t|
    	t.integer :series_illust_id
    	t.string :title
    	t.text :body
    	t.string :image_id
      t.timestamps
    end
  end
end
