require 'rails_helper'

RSpec.describe 'Owner Authentication', type: :request do
  let(:owner) { FactoryBot.create(:owner, password: 'password123', password_confirmation: 'password123') }

  describe 'POST /auth/login' do
    context 'with valid credentials' do
      it 'returns JWT token and 201 code' do
        post '/auth/login', params: {
          owner: { email: owner.email, password: 'password123' }
        }

        expect(response).to have_http_status(:created)
        expect(response.headers['Authorization']).to be_present
        token = response.headers['Authorization'].split.last
        expect(token).to be_a(String)
      end
    end

    context 'with invalid credentials' do
      it 'returns 401 code' do
        post '/auth/login', params: {
          owner: { email: owner.email, password: 'wrongpass' }
        }

        expect(response).to have_http_status(:unauthorized)
        expect(response.headers['Authorization']).to be_nil
        expect(json['error']).to match(/invalid/i)
      end
    end
  end

  describe 'DELETE /auth/logout' do
    context 'with valid token' do
      it 'invalidate token and returns 204' do
        post '/auth/login', params: {
          owner: { email: owner.email, password: 'password123' }
        }
        token = response.headers['Authorization'].split.last

        delete '/auth/logout', headers: {
          'Authorization' => "Bearer #{token}"
        }

        expect(response).to have_http_status(:no_content)
      end
    end
  end

  describe 'GET /up (optional authenticated route)' do
    it 'returns 200 without token' do
      get '/up'
      expect(response).to have_http_status(:ok)
    end

    it 'returns 200 with valid token' do
      post '/auth/login', params: {
        owner: { email: owner.email, password: 'password123' }
      }
      token = response.headers['Authorization'].split.last

      get '/up', headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to have_http_status(:ok)
    end
  end
end
