require 'cryptor'

class SecurityNote < ActiveRecord::Base
  belongs_to :user
  has_many :values, foreign_key: "security_note_id", class_name: "SecurityNoteValue"

  validates :title, presence: true

  after_find do |note|
    note.values.each do |note_val|
      note_val.value = SiteSecurity::Cryptor.instance.decrypt_value note_val.value
    end
  end

  before_save do |note|
    note.values.each do |note_val|
      note_val.value = SiteSecurity::Cryptor.instance.encrypt_value note_val.value
    end
  end
end
