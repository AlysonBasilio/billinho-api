class Registration < ApplicationRecord
  # model association
  belongs_to :institution
  belongs_to :student
  has_many :invoices, dependent: :destroy

  # validations
  validates_presence_of :value, :invoice_qty, :expiration_date, :course
  validates_numericality_of :value, greater_than: 0
  validates_numericality_of :invoice_qty, greater_than: 1
  validates_inclusion_of :expiration_date, in: 1..31
  validate :validate_invoice_qty

  private

  def validate_invoice_qty
    if invoices.length != invoice_qty
      errors.add(:invoice_qty, "cannot be different from the number of invoices related to this registration")
    end
  end

  def validate_invoices_total_value
    if invoices.inject(0) {|sum, i| sum + i.value} != value
      errors.add(:value, "cannot be different of the sum of the invoices values related to this registration")
    end
  end
end
