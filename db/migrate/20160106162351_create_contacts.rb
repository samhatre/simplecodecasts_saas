class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      #adding columns to the model/database
      t.string :name         # store name
      t.string :email        #store email
      t.text :comments       #store large text...
      
      t.timestamps
    end
  end
end
