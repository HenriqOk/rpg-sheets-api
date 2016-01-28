#coding: utf-8

FactoryGirl.define do
  factory :user do
    sequence :name do |i|
      "User #{i}"
    end
    # adventures {FactoryGirl.create_list(:adventure, 2)}
  end
end
