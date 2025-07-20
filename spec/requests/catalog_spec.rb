require 'rails_helper'

RSpec.describe "/catalog", type: :request, openapi: { security: [{"JWT" => []}] } do
  before(:all) do
    @owner, @headers = create_auth(email: "catalog@test.com", password: "Catalog@123")
    @category = FactoryBot.create(:category, owner: @owner)
    @product = FactoryBot.create(:product, category_id: @category.id)
  end

  after(:all) do
    @owner.destroy
  end

  describe "GET /index" do
    it "renders a successful response" do
      get catalog_url(owner_id: @owner.id), as: :json
      expect(response).to be_successful
    end
  end
end
