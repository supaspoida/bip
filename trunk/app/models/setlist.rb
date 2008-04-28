class Setlist < ActiveRecord::Base
  has_many :performances 
  has_many :songs, :through => :performances
  belongs_to :user
  belongs_to :appearance
  
  def band
    self.appearance.band
  end
end
