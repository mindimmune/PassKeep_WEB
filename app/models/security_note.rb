class SecurityNote < ActiveRecord::Base
  belongs_to :user
  has_many :values, foreign_key: "security_note_id", class_name: "SecurityNoteValue"
end
