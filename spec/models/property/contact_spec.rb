require 'spec_helper'

describe Property::Contact do
  subject { property }

  let(:user)     { create :user }
  let(:property) { create :valid_property }

  let(:property_owner)  { property.owner }
  let(:landlord_user)   { create :landlord_user }

  describe 'stats' do
    context 'random user' do
      it 'should not allow stats' do
        expect { subject.stats user }.to raise_error
      end
    end

    context 'landlord account that owns property' do
      it 'should not allow stats' do
        expect { subject.stats property_owner }.to_not raise_error
      end
    end
  end
end