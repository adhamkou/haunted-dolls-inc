class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :doll
  has_many :reviews
end
