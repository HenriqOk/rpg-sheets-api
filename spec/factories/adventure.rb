#coding: utf-8

FactoryGirl.define do
  factory :adventure do
    sequence :name do |i|
      "Adventure #{i}"
    end
    master { FactoryGirl.create(:user) }
  end
end
