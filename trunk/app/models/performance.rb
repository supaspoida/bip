class Performance < ActiveRecord::Base
  belongs_to :appearance
  belongs_to :setlist
  belongs_to :song
end
