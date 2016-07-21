class SecurityNoteValue < ActiveRecord::Base
  belongs_to :security_note

  validates :key, presence: true
  validates :value, presence: true
end
