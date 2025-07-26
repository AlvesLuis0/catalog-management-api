class Category < ApplicationRecord
  belongs_to :owner
  has_many :products, dependent: :destroy

  validates :title, presence: true, length: { maximum: 60 }

  after_save -> { UpdateCatalogService.call(owner_id) }
end
