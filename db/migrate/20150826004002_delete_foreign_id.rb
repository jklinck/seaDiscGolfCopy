class DeleteForeignId < ActiveRecord::Migration
  def change
  	remove_column :courses, :user_id, :comment_id
  end
end
