control 'service 01' do
  impact 1.0
  title 'neo4j service is running'
  desc 'Ensures that the neo4j service is up and running'
  describe service('neo4j') do
    it { should be_enabled }
    it { should be_installed }
    it { should be_running }
  end
end
