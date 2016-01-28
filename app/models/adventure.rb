class Adventure
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field :name, type: String

  belongs_to :master, class_name: "User"
  has_and_belongs_to_many :players, class_name: "User"
  embeds_many :sheets

  validates :master, presence: true
end
