require 'spec_helper'

describe Api::SheetsController, :type => :controller do

  let(:sheet) { FactoryGirl.create(:sheet) }

  describe "POST #create" do

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
    it "respond with the sheets json" do
      get :show, adventure_id: sheet.adventure.id, id: sheet.id
      expect(response.body).to eq sheet.to_json
    end
  end

  describe "PUT #update" do
    let(:new_name) { "A new name" }
    before(:each) do
      put :update, adventure_id: sheet.adventure.id, id: sheet.id, sheet: {name: new_name}
    end

    it "updates the given sheet" do
      expect(sheet.reload.name).to eq new_name
    end

    it "redirects to GET #show" do
      expect(response).to redirect_to api_adventure_sheet_path(adventure_id: sheet.adventure.id, id: sheet.id)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the give sheet" do
      delete :destroy, adventure_id: sheet.adventure.id, id: sheet.id
      expect(Adventure.find(sheet.adventure.id).sheets.where(id: sheet.id).count).to eq 0
      expect(response.status).to eq 204
    end
  end

end
