class User < ApplicationRecord

  # Active_record association

  has_one_attached :photo

  has_one :farmer
  has_many :messages

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

  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }

end
