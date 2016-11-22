# # encoding: utf-8

# Inspec test for recipe apache-test::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe user('root') do
  it { should exist }
  skip 'This is an example test, replace with your own test.'
  only_if { os.windows? }
end

describe port(80) do
  it { should_not be_listening }
  skip 'This is an example test, replace with your own test.'
end
