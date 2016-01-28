class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field :name, type: String

  #Associations
  has_and_belongs_to_many :adventures

  # Validations
  validates :name, presence: true
end
