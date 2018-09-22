class Registration < ApplicationRecord
  # model association
  belongs_to :institution
  belongs_to :student

  # validations
  validates_presence_of :value, :invoice_qty, :expiration_date, :course
end
