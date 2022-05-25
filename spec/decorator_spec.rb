require 'spec_helper'

describe Decorator do
  before :each do
    @nameable = Nameable.new
    @decorator = Decorator.new @nameable
  end

  describe '#new' do
    it 'takes one parameters and returns an error!' do
      @decorator.should be_an_instance_of Decorator
    end
  end
end
