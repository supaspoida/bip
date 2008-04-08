class Show < ActiveRecord::Base
  has_one :venue
  has_many :appearances
  has_many :bands, :through => :appearances
  
  named_scope :upcoming, lambda { { :conditions => ['date > ?', Time.now] } }
end
