class SetColumnRestritionsToInstitution < ActiveRecord::Migration[5.2]
  def up
    add_index :institutions, :name, unique: true
    change_column :institutions, :name, :string, null: false
    add_index :institutions, :cnpj, unique: true
    change_column :institutions, :cnpj, :string, null: false
    remove_column :institutions, :type
    add_column :institutions, :institution_type, :integer, null: true, default: 0
  end
  def down
    remove_index :institutions, :name
    change_column :institutions, :name, :string, null: true
    remove_index :institutions, :cnpj
    change_column :institutions, :cnpj, :string, null: true
    add_column :institutions, :type, :string, null: true
    remove_column :institutions, :institution_type
  end
end
