class CreateInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :cnpj
      t.string :type

      t.timestamps
    end
  end
end
