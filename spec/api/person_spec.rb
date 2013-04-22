require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'Person' do

  before do
    simulate_connection_to_server
  end

  it 'should load a person by ID' do
    VCR.use_cassette('person', :record => :new_episodes) do
      person = FellowshipOne::Person.load_by_id(44639467)
      #person.first_name.should == 'Wes'
      puts person.inspect
    end
  end

  it 'should load a person by a JSON string'

end


