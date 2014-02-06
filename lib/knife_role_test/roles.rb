#!/usr/bin/env ruby

require 'rubygems'
require 'minitest/autorun'
require 'chef'
require 'chef/knife/core/object_loader'
require 'pathname'

class TestRoles < MiniTest::Unit::TestCase

  @role_path = ENV['KRT_ROLE_PATH']

  def setup
    lib_dir = Pathname.new(ENV['KRT_ROLE_PATH']).realpath.parent.to_s + '/lib'
    $LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
    @loader = Chef::Knife::Core::ObjectLoader.new(Chef::Role, nil)
  end

  Dir.glob("#{@role_path}/*.rb") do |role_file|
    define_method "test_role_#{File.basename(role_file).sub('.rb', '')}" do
      assert @loader.load_from(@role_path, role_file)
    end
  end
end
