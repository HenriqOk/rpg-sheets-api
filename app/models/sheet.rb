class Sheet
  include Mongoid::Document
  include Mongoid::Timestamps

  VALID_STATES = ["Conscious", "Unconscious", "Stunned", "Feared", "Sleeping"]

  #Fields
  field :name, type: String
  field :level, type: Integer
  field :attack_bonus, type: Integer
  field :armor_class, type: Integer
  field :hp, type: Integer
  field :mp, type: Integer
  field :state, type: String

  # Associations
  belongs_to :player, class_name: "User"
  belongs_to :adventure

  # validates :player, presence: true
  validates :adventure, presence: true
  validates_inclusion_of :state, in: VALID_STATES
end
