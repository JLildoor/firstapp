class Product < ApplicationRecord
  has_many :orders
  has_many :comments
  validates :name, presence: true

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.last
  end

  def average_rating
    comments.average(:rating).to_f
  end
end

def self.search(search_term)
  if Rails.environment.production?
    Product.where("name LIKE ? OR description LIKE ?", "%#{search_term}%", "%#{search_term}%")
  else
    Product.where("name ilike ? OR description ilike ?", "%#{search_term}%", "%#{search_term}%")
  end
end
