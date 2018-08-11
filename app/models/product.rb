class Product < ApplicationRecord
  validates :title, :description, :price, presence: true
  validates :price, numericality: true
  validates :price, numericality: { greater_than: 0 }
  before_save :set_title_lowercase

  def set_title_lowercase
    self.title = title.downcase
  end
end
