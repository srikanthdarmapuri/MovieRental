class Movie < ActiveRecord::Base
  validates_uniqueness_of :name
  has_one :rental, dependent: :destroy
  
 
end
