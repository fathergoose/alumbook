require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "Users API" do
    it "GET /api/v1/user/:id sends a individual user" do
      user = FactoryGirl.create(:user)

      get "/api/v1/users/#{user.id}.json"
      expect(response).to have_http_status(:success)

      json = JSON.parse(response.body)
      expect(json['first_name']).to eq user.first_name
      expect(json['last_name']).to eq user.last_name
      expect(json['email']).to eq user.email
      expect(json['phone']).to eq user.phone
      expect(json['current_title']).to eq user.current_title
      expect(json['current_employer']).to eq user.current_employer
      expect(json['graduation_date'].to_date).to eq user.graduation_date
      expect(json['cohort_id']).to eq user.cohort_id
      expect(json['admin']).to eq user.admin
    end

    it "PUT /api/v1/users/:id updates a contact" do
      user = FactoryGirl.create(:user)
      new_attributes = {
        user: {
          first_name: 'John',
          last_name: 'Doe'
        }
      }

      put "/api/v1/users/#{user.id}.json", new_attributes
      expect(response).to be_success

      json = JSON.parse(response.body)
      expect(json['first_name']).to eq 'John'
      expect(json['last_name']).to eq 'Doe'
      expect(json['email']).to eq user.email
      expect(json['phone']).to eq user.phone
      expect(json['current_title']).to eq user.current_title
      expect(json['current_employer']).to eq user.current_employer
      expect(json['graduation_date'].to_date).to eq user.graduation_date
      expect(json['cohort_id']).to eq user.cohort_id
      expect(json['admin']).to eq user.admin
    end
  end
end
