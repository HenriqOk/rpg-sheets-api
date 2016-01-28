class Sheet
  include Mongoid::Document
  include Mongoid::Timestamps

  DEFAULT_STATE_INDEX = 0
  VALID_STATES = ["Conscious", "Unconscious", "Stunned", "Feared", "Sleeping", "Dead"]

  #Fields
  field :name, type: String
  field :level, type: Integer
  field :attack_bonus, type: Integer
  field :armor_class, type: Integer
  field :hp, type: Integer
  field :mp, type: Integer
  field :state, type: String, default: VALID_STATES[DEFAULT_STATE_INDEX]

  # Associations
  belongs_to :player, class_name: "User"
  embedded_in :adventure

  validates :player, presence: true
  validates :adventure, presence: true
  validates_inclusion_of :state, in: VALID_STATES
end
