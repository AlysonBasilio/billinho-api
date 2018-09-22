class Student < ApplicationRecord
  # model association
  has_many :registrations, dependent: :destroy

  # validations
  validates_presence_of :name, :cpf, :birth_date, :phone, :gender, :payment_method
end
