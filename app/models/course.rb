class Course < ActiveRecord::Base
  has_many :comments,  dependent: :destroy
  validates :name, presence:true
  validates :street, presence:true
  validates :state, presence:true
  validates :zip_code, presence:true
  validates :google_map, presence:true
end
