class Room < ApplicationRecord
   validates :room_name, presence: true
   validates :photo, presence: true
   validates :total, presence: true
   validates :address, presence: true
   validates :introducution, presence: true

   has_one_attached :photo

   has_many :reservations
   belongs_to :user

end
