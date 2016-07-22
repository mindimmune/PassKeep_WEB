require 'cryptor'

class SecurityNote < ActiveRecord::Base
  belongs_to :user
  has_many :values, foreign_key: "security_note_id", class_name: "SecurityNoteValue", :dependent => :delete_all
  accepts_nested_attributes_for :values

  validates :title, presence: true

  after_find do |note|
    note.values.each do |note_val|
      note_val.value = SiteSecurity::Cryptor.instance.decrypt_value note_val.value.strip
      note_val.key = SiteSecurity::Cryptor.instance.decrypt_value note_val.key.strip
    end
  end

  before_save do |note|
    note.values.each do |note_val|
      note_val.value = SiteSecurity::Cryptor.instance.encrypt_value note_val.value.strip
      note_val.key = SiteSecurity::Cryptor.instance.encrypt_value note_val.key.strip
    end
  end
end
