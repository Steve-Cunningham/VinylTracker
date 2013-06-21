class Album < ActiveRecord::Base
  attr_accessible :artist, :condition, :country, :label, :other, :title, :year
  validates_presence_of :user

  belongs_to :user

  scope :search_by, lambda{|search_term| where(:artist => search_term)}

end