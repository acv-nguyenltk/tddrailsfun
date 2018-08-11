class Product < ApplicationRecord
  belongs_to :category, optional: true
  validates :title, :description, :price, presence: true
  validates :price, numericality: true
  validates :price, numericality: { greater_than: 0 }
  before_save :set_title_lowercase
  validate :title_shorter_than_description

  def set_title_lowercase
    self.title = title.downcase
  end
  def title_shorter_than_description
    if title.present? && description.present? && title.length > description.length
      errors.add(:title, "must be shorter than description")
    end
  end
end
