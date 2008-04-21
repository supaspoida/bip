class Venue < ActiveRecord::Base
  has_many :shows
  
  def before_create
    @attributes['permalink'] = name.downcase.gsub(/\s+/, '-').gsub(/[^a-zA-Z0-9-]+/, '')
  end
end
