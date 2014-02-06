require 'chef/knife'

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
        }.map { |var, val| "#{var}=#{val}" }.join(" ")
        exec "#{env_vars} #{test_path}", *test_args
      end
    end
  end
end
