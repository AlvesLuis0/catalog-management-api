class Product < ApplicationRecord
  belongs_to :category
  has_one :owner, through: :category

  validates :title, presence: true, length: { maximum: 60 }
  validates :price, presence: true, comparison: { greater_than: 0 }

  after_save -> { UpdateCatalogJob.perform_async(owner.id) }
  after_destroy -> { UpdateCatalogJob.perform_async(owner.id) }
end
