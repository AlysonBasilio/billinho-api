class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.decimal :value
      t.integer :invoice_qty
      t.integer :expiration_date
      t.string :course
      t.references :institution, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
