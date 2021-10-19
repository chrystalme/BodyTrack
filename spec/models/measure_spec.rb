require 'rails_helper'

RSpec.describe Measure, type: :model do
  it { should have_many(:measurements).dependent(:destroy) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:unit) }
  it { should validate_presence_of(:description) }
end
