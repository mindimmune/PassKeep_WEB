class CreateSecurityNoteValues < ActiveRecord::Migration
  def change
    create_table :security_note_values do |t|
      t.references :security_note, index: true, foreign_key: true
      t.column :key, "char(30)"
      t.column :value, "char(255)"
      t.column :hidden, :boolean, default: false

      t.timestamps null: false
    end
  end
end
