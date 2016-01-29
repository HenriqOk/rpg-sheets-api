#coding: utf-8

FactoryGirl.define do
  factory :user do
    sequence :name do |i|
      "User #{i}"
    end
  end
end
