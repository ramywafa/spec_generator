require 'rails_helper'

RSpec.describe Listing, type: :model do
  it "has a valid factory" do
    expect(build(:listing)).to be_valid
  end

  let(:listing) { build(:listing) }

  context "validations" do
     
      it { expect(listing).to validate_numericality_of(:price) }
     
      it { expect(listing).to validate_presence_of(:price) }
     
      it { expect(listing).to validate_presence_of(:country) }
     
      it { expect(listing).to validate_length_of(:address) }
     
      it { expect(listing).to validate_presence_of(:address) }
    
  end
end
