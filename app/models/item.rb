class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipdate
  belongs_to :user

  validates :image,         presence: true
  validates :item_name,     presence: true
  validates :description,   presence: true
  validates :category_id,   numericality: { other_than: 1, message: "can't be blank" } 
  validates :status_id,     numericality: { other_than: 1, message: "can't be blank" } 
  validates :postage_id,    numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipdate_id,   numericality: { other_than: 1, message: "can't be blank" } 
  validates :price,         numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
