class Room < ApplicationRecord
   validates :name, presence: true
   validates :picture, presence: true
   validates :total, presence: true
   validates :address, presence: true
   validates :introducution, presence: true
   has_one_attached :image



end
