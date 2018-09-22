class Institution < ApplicationRecord
  # model association
  has_many :registrations, dependent: :destroy

  # validations
  validates_presence_of :name, :cnpj, :type
end
