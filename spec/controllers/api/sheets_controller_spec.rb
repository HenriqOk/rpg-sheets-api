require 'spec_helper'

describe Api::SheetsController, :type => :controller do

  let(:sheet) { FactoryGirl.create(:sheet) }

  describe "POST #create" do
    let(:sheet) { FactoryGirl.build(:sheet) }

    before(:each) do
      post :create, adventure_id: sheet.adventure.id, sheet: sheet.attributes
    end

    it "creates a new sheet" do
      new_sheet = assigns(:new_sheet)

      expect(new_sheet).to be_persisted
    end

    it "redirects to GET #show" do
      new_sheet = assigns(:new_sheet)

      expect(response).to redirect_to api_adventure_sheet_path(adventure_id: new_sheet.adventure.id, id: new_sheet.id)
    end

  end

  describe "GET #show" do
    it "respond with th sheets json" do
      get :show, adventure_id: sheet.adventure.id, id: sheet.id
      expect(response.body).to eq sheet.to_json
    end    
  end

end
