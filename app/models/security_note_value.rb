class SecurityNoteValue < ActiveRecord::Base
  belongs_to :security_note

  validates :key, presence: true
  validates :value, presence: true

  after_find do |note_val|
    note_val.value = SiteSecurity::Cryptor.instance.decrypt_value note_val.value.strip
    note_val.key = SiteSecurity::Cryptor.instance.decrypt_value note_val.key.strip
  end
end
