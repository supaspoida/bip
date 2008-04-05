class Band < ActiveRecord::Base
  has_many :appearances
  has_many :shows, :through => :appearances
  has_many :songs
end
