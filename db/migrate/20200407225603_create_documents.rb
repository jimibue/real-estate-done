class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :hoser
      t.string :thing1

      t.timestamps
    end
  end
end
