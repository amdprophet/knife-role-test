require 'chef/knife'
require 'open3'

class Chef
  class Knife
    class RoleTest < Chef::Knife

      banner "knife role test [-a|ROLE...]"

      option :all,
        :short => "-a",
        :long => "--all",
        :description => "Test all roles",
        :boolean => true

      def test_pattern
        name_args.map {|x| "^test_role_#{Regexp.escape(x)}$" }.join('|')
      end

      def test_args
        if config[:all]
          []
        elsif name_args.size > 0
          ['-n', "/#{test_pattern}/"]
        else
          ui.fatal "Must specify -a or some roles"
          exit 1
        end
      end

      def run
        test_path = "#{::KnifeRoleTest.root}/lib/knife_role_test/roles.rb"
        env_vars = {
          "KRT_ROLE_PATH" => Chef::Config[:role_path]
        }
        Open3.popen3(env_vars, test_path, *test_args) do |stdin, stdout, stderr, wait_thr|
          stderr_text = stderr.read
          stdout_text = stdout.read
          puts stderr_text
          puts stdout_text
          stdout_text
        end
      end
    end
  end
end
