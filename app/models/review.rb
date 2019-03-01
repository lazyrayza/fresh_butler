class Review < ApplicationRecord

  belongs_to :client, class_name: :User, foreign_key: "client_id"
  belongs_to :butler, class_name: :User, foreign_key: "butler_id"


  validates :description, presence: true
end
