class Institution < ApplicationRecord
  # enum declarations
  enum institution_type: {Universidade: 0, Escola: 1, Creche: 2}

  # model association
  has_many :registrations, dependent: :destroy

  # validations
  validates_presence_of :name, :cnpj, :institution_type
  validates_uniqueness_of :name, :cnpj
  validates_numericality_of :cnpj, :only_integer => true
end
