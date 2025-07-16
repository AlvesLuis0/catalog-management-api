class Category < ApplicationRecord
  belongs_to :owner

  validates :title, presence: true, length: { maximum: 60 }
end
