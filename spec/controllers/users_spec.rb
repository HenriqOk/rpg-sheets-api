require 'spec_helper'

describe Api::UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user)}
  specify "true" do
    user
    expect(true).to be true
  end
end
