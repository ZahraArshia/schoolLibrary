require './teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('bio', 40, 'Jude ham')
  end
  context 'given arguments' do
    it 'instantiate an object ' do
      expect(@teacher).to be_instance_of(Teacher)
    end
  end
end
