class Booking < ApplicationRecord
  belongs_to :butler, class_name: :User, foreign_key: 'butler_id'
  belongs_to :client, class_name: :User, foreign_key: 'client_id'
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true

  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end

end
