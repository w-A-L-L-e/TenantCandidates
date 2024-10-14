class CreateHuurders < ActiveRecord::Migration[7.1]
  def change
    create_table :huurders do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :remarks
      t.text :evaluation
      t.datetime :appointment

      t.timestamps
    end
  end
end
