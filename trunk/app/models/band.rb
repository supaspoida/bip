class Band < ActiveRecord::Base
  has_many :appearances
  has_many :shows, :through => :appearances
  has_many :songs
  has_many :setlists, :through => :appearances
  
  def before_create
    @attributes['permalink'] = name.downcase.gsub(/\s+/, '-').gsub(/[^a-zA-Z0-9-]+/, '')
  end
  
  def to_param
    "#{id}-#{permalink}"
  end
end
