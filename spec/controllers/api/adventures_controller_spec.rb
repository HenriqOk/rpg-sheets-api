require 'spec_helper'

describe Api::AdventuresController, :type => :controller do
  let(:adventure) { FactoryGirl.create(:adventure) }

  describe "POST #create" do
    let(:new_adventure_name) { "O covil do Terceiro" }
    let(:players_ids) { FactoryGirl.create_list(:user, 3).map(&:id) }
    let(:master_id) { FactoryGirl.create(:user).id}

    before(:each) do
      params = {adventure: { name: new_adventure_name, master_id: master_id, player_ids: players_ids } }
      post :create, params
    end

    it "creates a adventure" do
      new_adventure = assigns(:adventure)

      expect(new_adventure.name).to eq new_adventure_name
      players_ids.each { |player_id| expect(new_adventure.player_ids).to include player_id }
    end

    it "redirects to GET #show" do
      new_adventure = assigns(:adventure)
      expect(response).to redirect_to api_adventure_path(id: new_adventure.id)
    end

  end

  describe "GET #show" do
    it "respond with the adventures json" do
      get :show, id: adventure.id
      expect(response.body).to eq adventure.to_json
    end
  end

  describe "PATCH #update" do
    let(:new_adventure_name) { "Henrique" }
    let(:players_ids) { FactoryGirl.create_list(:adventure, 3).map(&:id) }
    let(:master_id) { FactoryGirl.create(:user).id}

    before(:each) do
      patch :update, id: adventure.id, adventure: { name: new_adventure_name, master_id: master_id, player_ids: players_ids }
    end

    it "respond with the adventures json" do
      adventure.reload

      expect(adventure.name).to eq new_adventure_name
      players_ids.each { |player_id| expect(adventure.player_ids).to include player_id }
    end

    it "redirects to GET #show" do
      expect(response).to redirect_to api_adventure_path(id: adventure.id)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the given adventure" do
      delete :destroy, id: adventure.id
      expect(Adventure.where(id: adventure.id).count).to eq 0
    end
  end

end
