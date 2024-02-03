class Farmer < ApplicationRecord

  belongs_to :user

  validates :name, presence: true
  validates :adress, presence: true
  validates :description, presence: true

end
