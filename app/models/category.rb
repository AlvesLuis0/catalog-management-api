class Category < ApplicationRecord
  belongs_to :owner

  validates :name, presence: true, length: { maximum: 60 }
end
