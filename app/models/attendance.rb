class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  
  validates_presence_of :user_id, :show_id
  validates_uniqueness_of :user_id, :scope => :show_id, :message => "is already attending this show"
end
