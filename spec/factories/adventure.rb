#coding: utf-8

FactoryGirl.define do
  factory :adventure do
    sequence :name do |i|
      "Adventure #{i}"
    end
    master { FactoryGirl.create(:user) }
    # players { FactoryGirl.create_list(:user, 2) }
    sheets { FactoryGirl.create_list(:sheet, 3) }
  end
end
