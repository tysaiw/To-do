class Category < ApplicationRecord
  has_many :todos
  belongs_to :user

  validates :name, presence: true
  validate :limit_categories, on: :create

  def limit_categories
    if user.categories.count >= 4
      errors.add(:base, "You can't have more than 4 categories.")
    end
  end
end
