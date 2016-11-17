#
# Cookbook Name:: nodes
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Print every node name matching the search pattern
search("node", "*:*").each do |matching_node|
  puts matching_node.to_s
end
