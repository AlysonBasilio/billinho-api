class Student < ApplicationRecord
  # enum declarations
  enum gender: {M: 0, F: 1}
  enum payment_method: {Boleto: 0, Cartao: 1}

  # model association
  has_many :registrations, dependent: :destroy

  # validations
  validates_presence_of :name, :cpf, :gender, :payment_method
  validates_uniqueness_of :name, :cpf
  validates_numericality_of :cpf, :only_integer => true
end
