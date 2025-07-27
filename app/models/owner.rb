class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenyList

  has_many :categories, dependent: :destroy
  has_many :products, through: :categories, dependent: :destroy

  validates :name, presence: true, length: { maximum: 60 }

  after_create -> { UpdateCatalogJob.perform_async(id) }
  after_destroy -> { UpdateCatalogJob.perform_async(id) }

  def update(attributes)
    super(attributes)
    if attributes.has_key?(:name)
      UpdateCatalogJob.perform_async(id)
    end
  end
end
