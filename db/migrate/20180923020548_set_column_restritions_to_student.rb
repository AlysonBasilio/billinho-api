class SetColumnRestritionsToStudent < ActiveRecord::Migration[5.2]
  def up
    add_index :students, :name, unique: true
    change_column :students, :name, :string, null: false
    add_index :students, :cpf, unique: true
    change_column :students, :cpf, :string, null: false
    change_column :students, :gender, :integer, null: true, default: 0
    change_column :students, :payment_method, :integer, null: true, default: 0
  end
  def down
    remove_index :students, :name
    change_column :students, :name, :string, null: true
    remove_index :students, :cpf
    change_column :students, :cpf, :string, null: true
    change_column :students, :gender, :string, null: false
    change_column :students, :payment_method, :string, null: false
  end
end
