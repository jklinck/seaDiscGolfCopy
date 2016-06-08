class DeleteComment < ActiveRecord::Migration
  def change
  	remove_column :courses, :comment_id
  end
end
