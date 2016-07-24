class CreateSecurityNoteValues < ActiveRecord::Migration
  def change
    create_table :security_note_values do |t|
      t.references :security_note, index: true, foreign_key: true
      t.string :key
      t.text :value
      t.boolean :hidden, default: false
      t.integer :order

      t.timestamps null: false
    end
  end
end
