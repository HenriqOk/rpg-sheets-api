class Adventure
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :master, class_name: "User"
  has_many :players, class_name: "User"
  has_many :sheets

  validates :master, presence: true
end
