class Adventure
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field :name, type: String

  #Associations
  belongs_to :master, class_name: "User"
  has_and_belongs_to_many :players, class_name: "User"
  embeds_many :sheets

  #Validations
  validates :master, presence: true
end
