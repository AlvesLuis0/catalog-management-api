class CatalogController < ApplicationController
  def show
    @owner = Owner.find(params[:owner_id])
    @catalog_url = "https://#{get_bucket}.s3.#{get_region}.amazonaws.com/#{@owner.id}-catalog.json"
    render json: { catalog_url: @catalog_url }
  end

  private

  def get_bucket
    ENV.fetch("AWS_BUCKET_NAME") { Rails.application.credentials.dig(:aws, :s3, :bucket_name) }
  end

  def get_region
    Aws.config[:region]
  end
end
