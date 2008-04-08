class Appearance < ActiveRecord::Base
  belongs_to :show
  belongs_to :band
  has_many :performances
  has_many :songs, :through => :performances
  has_many :setlists
end