require 'rails_helper'

RSpec.describe Invoice, type: :model do
  # Association test
  # ensure Invoice model has a m:1 relationship with the Registration model
  it { should belong_to(:registration) }
  # Validation tests
  # ensure columns value, expiration_date, status and ragistration are present before saving
  it { should validate_presence_of(:value) }
  it { should validate_presence_of(:expiration_date) }
  it { should validate_presence_of(:status) }
end
