require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Header do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ header }).should.be.instance_of Command::Header
      end
    end
  end
end

