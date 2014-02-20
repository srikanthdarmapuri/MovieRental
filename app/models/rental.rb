class Rental < ActiveRecord::Base
  belongs_to :customer
  belongs_to :movie
  
  validates :mobile, presence: true, length: { minimum: 10 }, numericality: { only_integer: true }
  
end
