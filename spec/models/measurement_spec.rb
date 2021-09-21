require 'rails_helper'

RSpec.describe Measurement, type: :model do
  it { should belong_to(:measure) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:value) }
  it { should validate_presence_of(:date) }
end
