class Album < ActiveRecord::Base
  attr_accessible :artist, :condition, :country, :label, :other, :title, :year
end
