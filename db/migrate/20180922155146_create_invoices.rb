class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.decimal :value
      t.date :expiration_date
      t.string :status
      t.references :registration, foreign_key: true

      t.timestamps
    end
  end
end
