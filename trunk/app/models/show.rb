class Show < ActiveRecord::Base
  has_one :venue
  has_many :appearances
  has_many :bands, :through => :appearances
end
