class UpdateCatalogJob
  include Sidekiq::Job

  def perform(owner_id)
    catalog = generate_catalog(owner_id)
    publish_catalog(catalog)
    catalog
  end

  private

  OWNER_SHOW = [ :id, :name ]
  CATEGORY_SHOW = [ :id, :title, :description ]
  PRODUCT_SHOW = [ :id, :title, :description, :price ]

  def generate_catalog(owner_id)
    catalog = Owner.includes(categories: :products).find(owner_id)
    catalog.to_json(
      only: OWNER_SHOW, include: {
      categories: { only: CATEGORY_SHOW, include: {
        products: { only: PRODUCT_SHOW }
      } }
    })
  end

  def publish_catalog(catalog)
    return if ENV.fetch("RAILS_ENV") == "test"
    sns = Aws::SNS::Client.new
    sns.publish(
      topic_arn: ENV.fetch("AWS_SNS_TOPIC_ARN") { Rails.application.credentials.dig(:aws, :sns, :topic_arn) },
      message: catalog
    )
  end
end
