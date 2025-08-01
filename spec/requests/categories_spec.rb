require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/categories", type: :request, openapi: { security: [ { "BearerToken" => [] } ] } do
  before(:all) do
    @owner, @headers = create_auth(email: "categories@test.com", password: "Categories@123")
  end

  after(:all) do
    @owner.destroy
  end

  # This should return the minimal set of attributes required to create a valid
  # Category. As you add validations to Category, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryBot.attributes_for(:category, owner: nil) }
  let(:invalid_attributes) { FactoryBot.attributes_for(:category, title: nil, owner: nil) }
  let(:category) { FactoryBot.create(:category, owner: @owner) }

  describe "GET /index" do
    it "renders a successful response" do
      get categories_url, headers: @headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get category_url(category), headers: @headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Category" do
        expect {
          post categories_url,
               params: { category: valid_attributes }, headers: @headers, as: :json
        }.to change(Category, :count).by(1)
      end

      it "renders a JSON response with the new category" do
        post categories_url,
             params: { category: valid_attributes }, headers: @headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Category" do
        expect {
          post categories_url,
               params: { category: invalid_attributes }, headers: @headers, as: :json
        }.to change(Category, :count).by(0)
      end

      it "renders a JSON response with errors for the new category" do
        post categories_url,
             params: { category: invalid_attributes }, headers: @headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { description: "My simple description" } }

      it "updates the requested category" do
        patch category_url(category),
              params: { category: new_attributes }, headers: @headers, as: :json
        category.reload
        expect(category.description).to eq(new_attributes[:description])
      end

      it "renders a JSON response with the category" do
        patch category_url(category),
              params: { category: new_attributes }, headers: @headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the category" do
        patch category_url(category),
              params: { category: invalid_attributes }, headers: @headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested category" do
      category # to create a category before the block
      expect {
        delete category_url(category), headers: @headers, as: :json
      }.to change(Category, :count).by(-1)
    end
  end
end
