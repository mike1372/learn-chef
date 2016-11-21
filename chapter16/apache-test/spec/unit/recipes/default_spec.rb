#
# Cookbook Name:: apache-test
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

# describe 'apache-test::default' do
#   context 'When all attributes are default, on an unspecified platform' do
#     let(:chef_run) do
#       runner = ChefSpec::ServerRunner.new
#       runner.converge(described_recipe)
#     end

#     it 'converges successfully' do
#       expect { chef_run }.to_not raise_error
#     end
#   end
# end

describe 'apache-test::default' do
  let (:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs apache2' do
    expect(chef_run).to install_package('httpd')
  end
end
