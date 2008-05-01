class Performance < ActiveRecord::Base
  belongs_to :appearance
  belongs_to :setlist, :counter_cache => true
  belongs_to :song
end
