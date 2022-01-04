class ReferenceNotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :notes, :writer_name  
  end
end
