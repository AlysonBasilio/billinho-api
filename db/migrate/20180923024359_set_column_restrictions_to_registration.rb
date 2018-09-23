class SetColumnRestrictionsToRegistration < ActiveRecord::Migration[5.2]
  def up
    change_column :registrations, :value, :decimal, null: false
    change_column :registrations, :invoice_qty, :integer, null: false
    change_column :registrations, :expiration_date, :integer, null: false
    change_column :registrations, :course, :string, null: false
    change_column :registrations, :institution_id, :integer, null: false
    change_column :registrations, :student_id, :integer, null: false
  end
  def down
    change_column :registrations, :value, :decimal, null: true
    change_column :registrations, :invoice_qty, :integer, null: true
    change_column :registrations, :expiration_date, :integer, null: true
    change_column :registrations, :course, :string, null: true
    change_column :registrations, :institution_id, :integer, null: true
    change_column :registrations, :student_id, :integer, null: true
  end
end
