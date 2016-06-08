class GoogleMap < ActiveRecord::Migration
  def change
  	remove_column :courses, :google_map
  	add_column :courses, :google_map, :text
  end
end
