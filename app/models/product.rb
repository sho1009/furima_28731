class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  belongs_to_active_hash :genre
  belongs_to :user
  validates :name, presence: true
  validates :explanation, presence: true
  validates :genre_id, presence: true
  validates :status_id, presence: true
  validates :burden_id, presence: true
  validates :area_id, presence: true
  validates :days_id, presence: true
  validates :value, presence: true
  validates :user, presence: true  
  # validates :image, presence: true  
  has_many :products
  has_one_attached :image


end

