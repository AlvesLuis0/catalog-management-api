# frozen_string_literal: true

class UpdateCatalogService
  def self.call(owner_id)
    catalog = generate_catalog(owner_id)
    publish_catalog(catalog)
    catalog
  end

  private

  OWNER_SHOW = [ :id, :name ]
  CATEGORY_SHOW = [ :id, :title, :description ]
  PRODUCT_SHOW = [ :id, :title, :description, :price ]

  def self.generate_catalog(owner_id)
    catalog = Owner.includes(categories: :products).find(owner_id)
    catalog.to_json(
      only: OWNER_SHOW, include: {
      categories: { only: CATEGORY_SHOW, include: {
        products: { only: PRODUCT_SHOW }
      } }
    })
  end

  def self.publish_catalog(catalog)
    sns = Aws::SNS::Client.new
    sns.publish(
      topic_arn: ENV.fetch("AWS_SNS_TOPIC_ARN") { Rails.application.credentials.dig(:aws, :sns, :topic_arn) },
      message: catalog
    )
  end
end
