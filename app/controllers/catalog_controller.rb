class CatalogController < ApplicationController
  OWNER_SHOW = [ :id, :name ]
  CATEGORY_SHOW = [ :id, :title, :description ]
  PRODUCT_SHOW = [ :id, :title, :description, :price ]

  def show
    @catalog = Owner.includes(categories: :products).find(params.expect(:owner_id))
    render json: @catalog.to_json(
      only: OWNER_SHOW, include: {
        categories: { only: CATEGORY_SHOW, include: {
          products: { only: PRODUCT_SHOW }
        } }
      })
  end
end
