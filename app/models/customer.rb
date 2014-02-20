class Customer < ActiveRecord::Base
  validates :mobile, presence: true, length: { minimum: 10 }, numericality: { only_integer: true }
  validates_uniqueness_of :mobile 
  has_many :rentals, dependent: :destroy
end
