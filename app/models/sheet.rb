class Sheet
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :player, class_name: "User"
  belongs_to :adventure
end
