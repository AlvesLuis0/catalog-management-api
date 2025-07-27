class Category < ApplicationRecord
  belongs_to :owner
  has_many :products, dependent: :destroy

  validates :title, presence: true, length: { maximum: 60 }

  after_save -> { UpdateCatalogJob.perform_async(owner_id) }
  after_destroy -> { UpdateCatalogJob.perform_async(owner_id) }
end
