#coding: utf-8

FactoryGirl.define do
  factory :sheet do
    sequence :name do |i|
      "Sheet #{i}"
    end
    level 20
    attack_bonus 10
    armor_class 9001
    hp 80
    mp 0
    state Sheet::VALID_STATES[Sheet::DEFAULT_STATE_INDEX]
  end
end
