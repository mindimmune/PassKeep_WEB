class CreateSecurityNotes < ActiveRecord::Migration
  def change
    create_table :security_notes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.integer :order
      t.timestamps null: false
    end
  end
end
