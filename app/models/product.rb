class Product < ApplicationRecord
  extend Enumerize
  belongs_to :category, optional: true
  validates :title, :description, :price, presence: true
  validates :price, numericality: true
  validates :price, numericality: { greater_than: 0 }
  before_save :set_title_lowercase, :strip_html_description
  before_save :title_shorter_than_description
  # another validate title shoter than description
  # validate :title_shorter_than_description

  scope :published, -> { where(published: true) }
  scope :priced_more_than, ->(price) { where('price > ?',price) }
  enumerize :level, in: { easy: 1, medium: 2, hard: 3 }
  enumerize :country, in: ISO3166::Country.translations.invert

  def set_title_lowercase
    self.title = title.downcase
  end
  def title_shorter_than_description
    if title.present? && description.present? && title.length > description.length
      errors.add(:title, "must be shorter than description")
      throw(:abort)
    end
  end
  def strip_html_description
    self.description = ActionView::Base.full_sanitizer.sanitize(description)
  end
end
