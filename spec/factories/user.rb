#coding: utf-8

FactoryGirl.define do
  factory :user do
    sequence :name do |i|
      "User #{i}"
    end

    sequence :email do |i|
      "user#{i}@com.br"
    end

    password "123123123"

  end
end
