require 'spec_helper'

describe PersonDecorator do
  let(:pd) {PersonDecorator.decorate(FactoryGirl.create(:person))}

  describe '#url' do
    it 'is a link to the person' do
      pd.url.should == person_path(pd)
    end
  end
end
