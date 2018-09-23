class Registration < ApplicationRecord
  # model association
  belongs_to :institution
  belongs_to :student

  # validations
  validates_presence_of :value, :invoice_qty, :expiration_date, :course
  validates_numericality_of :value, greater_than: 0
  validates_numericality_of :invoice_qty, greater_than: 1
  validates_inclusion_of :expiration_date, in: 1..31
end
