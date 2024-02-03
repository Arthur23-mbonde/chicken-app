class User < ApplicationRecord

  # Active_record association

  has_one_attached :photo

  has_one :farmer

  ###

  # Validate custom parameters (or fields) for user
  validates :role, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :phone, presence: true
  validates :address, presence: true

  ###

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
