class Product < ApplicationRecord

  has_many_attached :pictures

  belongs_to :race
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :current_price, presence: true
  validates :disponibility, presence: true
  validates :evaluation, presence: true
  validates :race_id, presence: false
  validates :category_id, presence: true

end
