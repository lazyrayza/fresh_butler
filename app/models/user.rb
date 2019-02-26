class User < ApplicationRecord
  USER_TYPE = %(Butler Client)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :butler_bookings, class_name: :Booking, foreign_key: "butler_id", dependent: :destroy
  has_many :client_bookings, class_name: :Booking, foreign_key: "client_id", dependent: :destroy

  validates :user_type, presence: true, inclusion: { in: USER_TYPE }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
