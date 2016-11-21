require 'spec_helper'

# Note the below is not actually needed but is here for illustration purposes
set :os, :family => 'redhat', :release => 6

describe 'web site' do
  it 'has the apache web server installed' do
    expect(package 'httpd').to be_installed
  end

  it 'responds on port 80' do
    expect(port 80).to be_listening 'tcp'
  end

  it 'returns eth1 in the HTML body' do
    expect(command('curl localhost:80').stdout).to match /eth1/
  end
end
