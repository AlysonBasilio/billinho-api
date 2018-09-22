class Invoice < ApplicationRecord
  # model association
  belongs_to :registration

  # validations
  validates_presence_of :value, :expiration_date, :status
end
