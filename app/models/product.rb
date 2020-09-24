class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  belongs_to_active_hash :genre
  belongs_to :user
  validates :name, presence: true
  validates :explanation, presence: true
  validates :genre_id, presence: true, length: { minimum:1 }
  validates :status_id, presence: true, length: { minimum:1 }
  validates :burden_id, presence: true, length: { minimum:1 }
  validates :area_id, presence: true, length: { minimum:1 }
  validates :days_id, presence: true, length: { minimum:1 }
  validates :user, presence: true
  validates :image, presence: true  
  has_many :products
  has_one_attached :image
  validates :value, presence: true, uniqueness: true, length: { minimum:300 , maximum:10000000 }

end

