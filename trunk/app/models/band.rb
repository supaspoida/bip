class Band < ActiveRecord::Base
  has_many :appearances
  has_many :shows, :through => :appearances
  has_many :songs
  
  def before_create
    @attributes['permalink'] = name.downcase.gsub(/\s+/, '-').gsub(/[^a-zA-Z0-9-]+/, '')
  end
end
