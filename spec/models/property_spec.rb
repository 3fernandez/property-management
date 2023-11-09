require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should have_many(:events) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:status) }
  it { should define_enum_for(:status).with_values(available: 0, sold: 1) }
end
