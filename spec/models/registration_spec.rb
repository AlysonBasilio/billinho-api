require 'rails_helper'

RSpec.describe Registration, type: :model do
  # Association test
  # ensure Registration model has a m:1 relationship with the Institution model
  it { should belongs_to(:institution).dependent(:destroy) }
  # ensure Registration model has a m:1 relationship with the Student model
  it { should belongs_to(:student).dependent(:destroy) }
  # Validation tests
  # ensure columns value, expiration_date, invoice_qty and course are present before saving
  it { should validate_presence_of(:value) }
  it { should validate_presence_of(:invoice_qty) }
  it { should validate_presence_of(:expiration_date) }
  it { should validate_presence_of(:course) }
end
