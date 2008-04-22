class Show < ActiveRecord::Base
  belongs_to :venue
  has_many :appearances
  has_many :bands, :through => :appearances
  has_many :attendances
  has_many :users, :through => :attendances
  
  named_scope :upcoming, lambda { { :conditions => ['date > ?', Time.now] } }
  named_scope :archived, lambda { { :conditions => ['date < ?', Time.now] } }
end
