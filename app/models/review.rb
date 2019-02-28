class Review < ApplicationRecord
 belong_to :user, :as => :butler
 has_many :users, :as => :butler, through: :booking

 validates :description, presence: true
end
