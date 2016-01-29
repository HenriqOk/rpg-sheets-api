require 'spec_helper'

describe Api::UsersController, :type => :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:advendures) { FactoryGirl.create_list(:adventure, 3)}

  describe "POST #create" do
    let(:new_user_name) { "Henrique" }
    it "creates a user" do
      params = {user: { name: new_user_name, adventure_ids: advendures.map(&:id) } }
      post :create, params

      byebug
    end

  end

end
