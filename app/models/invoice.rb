class Invoice < ApplicationRecord
  # enum declarations
  enum status: {Aberta: 0, Atrasada: 1 , Paga: 2}

  # model association
  belongs_to :registration

  # validations
  validates_presence_of :value, :expiration_date, :status
end
