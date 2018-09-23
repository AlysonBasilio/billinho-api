class SetColumnRestritionsToInvoice < ActiveRecord::Migration[5.2]
  def up
    change_column :invoices, :value, :decimal, null: false
    change_column :invoices, :expiration_date, :date, null: false
    change_column :invoices, :registration_id, :integer, null: false
    change_column :invoices, :status, :integer, null: false, default: 0
  end
  def down
    change_column :invoices, :value, :decimal, null: true
    change_column :invoices, :expiration_date, :date, null: true
    change_column :invoices, :registration_id, :integer, null: true
    change_column :invoices, :status, :string, null: true
  end
end
