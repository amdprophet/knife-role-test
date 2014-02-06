require 'chef/knife/role_test'
require 'knife_role_test'

describe Chef::Knife::RoleTest do

  before do
    Chef::Log.logger = Logger.new(StringIO.new)
    @spec_data = "#{::KnifeRoleTest.root}/spec/data"
    Chef::Config[:role_path] = "#{@spec_data}/roles"
    @knife = Chef::Knife::RoleTest.new
    @knife.config[:all] = false
    @knife.name_args = []
    $stdout.stub(:write)
    $stderr.stub(:write)
  end

  it "tests a single role" do
    @knife.name_args = ["regular_role"]
    expect(@knife.run).to include("1 tests, 1 assertions, 0 failures, 0 errors, 0 skips")
  end

  it "tests a role with a library dependency" do
    @knife.name_args = ["library_role"]
    expect(@knife.run).to include("1 tests, 1 assertions, 0 failures, 0 errors, 0 skips")
  end

  it "tests multiple roles" do
    @knife.name_args = ["regular_role", "library_role"]
    expect(@knife.run).to include("2 tests, 2 assertions, 0 failures, 0 errors, 0 skips")
  end

  it "tests all roles" do
    @knife.config[:all] = true
    expect(@knife.run).to include("3 tests, 3 assertions, 0 failures, 0 errors, 0 skips")
  end

  context "broken roles" do
    before do
      Chef::Config[:role_path] = "#{@spec_data}/broken_roles"
    end

    it "tests a broken role" do
      @knife.name_args = ["regular_role"]
      expect(@knife.run).to include("1 tests, 0 assertions, 0 failures, 1 errors, 0 skips")
    end

    it "tests a broken role" do
      @knife.name_args = ["library_role"]
      expect(@knife.run).to include("1 tests, 0 assertions, 0 failures, 1 errors, 0 skips")
    end
  end

end
