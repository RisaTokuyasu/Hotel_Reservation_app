class Room < ApplicationRecord
   validates :room_name, presence: true
   validates :picture, presence: true
   validates :total, presence: true
   validates :address, presence: true
   validates :introducution, presence: true
   has_one_attached :image

   has_many :reservations
   belongs_to :user

   #def self.search(search)
    #  search ? where([ 'adress LIKE ? OR introduction LIKE ? OR room_name LIKE ? ', "%#{search}%","%#{search}%","%#{search}%" ]) :all
   # end


end
