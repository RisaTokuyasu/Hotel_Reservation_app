class Room < ApplicationRecord
   validates :name, presence: true
   validates :picture, presence: true
   validates :total, presence: true
   validates :address, presence: true
   validates :introducution, presence: true
   has_one_attached :image

   has_many :reservations

   def self.search(search)
      if search
        Room.where(['adress LIKE ? OR introduction LIKE ? OR name LIKE ? OR price LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
      else
        Room.all
      end
    end


end
