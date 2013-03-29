require 'spec_helper'

describe Person do
  before(:each) do
    @person = Person.create(phone_number: '555-555-5555')
  end

  describe 'Properties' do
    it {should respond_to :phone_number}
    it {should validate_presence_of :phone_number}
    it {should respond_to :fullname}
    it {should respond_to :nickname}
    it {should respond_to :active}
  end

  describe 'Calculated Properties' do
    describe '#response_count' do
      before(:each) do
        @response_count = @person.response_count
      end

      it 'is an integer' do
        @response_count.should be_a(Integer)
      end
    end

    describe '#call_count' do
      before(:each) do
        @call_count = @person.call_count
      end

      it 'is an integer' do
        @call_count.should be_a(Integer)
      end
    end
  end

  describe 'Relationships' do
    describe '#situations' do
      before(:each) do
        @situations = @person.situations
      end

      it 'is enumerable' do
        @situations.should respond_to(:each)
      end
    end
  end
end
