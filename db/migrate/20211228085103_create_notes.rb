class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :writer_name
      t.string :title
      t.text :description
        t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
