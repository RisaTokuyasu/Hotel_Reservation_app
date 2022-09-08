class Reservation < ApplicationRecord
   validates :start_date, presence: true
   validates :end_date, presence: true
   validates :people, presence: true

   belongs_to :room
   belongs_to :user
end

