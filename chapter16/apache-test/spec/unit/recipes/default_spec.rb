#
# Cookbook Name:: apache-test
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache-test::default' do
  let (:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'Installs apache2' do
    expect(chef_run).to install_package('httpd')
  end

  it 'Enables the httpd service' do
    expect(chef_run).to enable_service('httpd')
  end

  it 'Starts the httpd service' do
    expect(chef_run).to start_service('httpd')
  end

  it 'Sets up the index page' do
    expect(chef_run).to create_template('/var/www/html/index.html').with(
      mode: '0644'
    )
  end
end
