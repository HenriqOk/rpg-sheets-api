require 'spec_helper'

describe Api::UsersController, :type => :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe "POST #create" do
    let(:new_user_name) { "Henrique" }
    let(:new_user_email) { "henrique@com.br" }
    let(:new_user_password) { "123123123" }
    let(:adventures_ids) { FactoryGirl.create_list(:adventure, 3).map(&:id) }

    before(:each) do
      params = {user: {email: new_user_email, password: new_user_password, password_confirmation: new_user_password, name: new_user_name, adventure_ids: adventures_ids } }
      post :create, params
    end

    it "creates a user" do
      new_user = assigns(:user)

      expect(new_user.name).to eq new_user_name
      expect(new_user.email).to eq new_user_email
      expect(new_user.valid_password?(new_user_password)).to eq true
      adventures_ids.each { |adventure_id| expect(new_user.adventure_ids).to include adventure_id }
    end

    it "redirects to GET #show" do
      new_user = assigns(:user)
      expect(response).to redirect_to api_user_path(id: new_user.id)
    end

  end

  describe "GET #show" do
    it "respond with the users json" do
      get :show, id: user.id
      expect(response.body).to eq user.to_json
    end
  end

  describe "PATCH #update" do
    let(:new_user_name) { "Henrique" }
    let(:adventures_ids) { FactoryGirl.create_list(:adventure, 3).map(&:id) }

    before(:each) do
      patch :update, id: user.id, user: { name: new_user_name, adventure_ids: adventures_ids }
    end

    it "respond with the users json" do
      user.reload

      expect(user.name).to eq new_user_name
      adventures_ids.each { |adventure_id| expect(user.adventure_ids).to include adventure_id }
    end

    it "redirects to GET #show" do
      expect(response).to redirect_to api_user_path(id: user.id)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the given user" do
      delete :destroy, id: user.id
      expect(User.where(id: user.id).count).to eq 0
      expect(response.status).to eq 204
    end
  end

end
