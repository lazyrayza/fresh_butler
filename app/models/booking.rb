class Booking < ApplicationRecord
  belongs_to :butler, class_name: :User, foreign_key: 'butler_id'
  belongs_to :client, class_name: :User, foreign_key: 'client_id'
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true
  validates :status, presence: true
end
