class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :street
      t.string :state
      t.string :zip_code
      t.string :google_map
      t.references :user, index: true
      t.references :comment, index: true

      t.timestamps
    end
  end
end
