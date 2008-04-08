class Page < ActiveRecord::Base
  validates_presence_of :title
  validates_length_of :title, :within => 3..255
  
  def before_create
    @attributes['permalink'] = title.downcase.gsub(/\s+/, '-').gsub(/[^a-zA-Z0-9_]+/, '')
  end
  
  def to_param
    "#{id}-#{permalink}"
  end
end
