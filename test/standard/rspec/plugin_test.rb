require "test_helper"

module Standard::Rspec
  class PluginTest < Minitest::Test
    def setup
    end

    def test_default_configuration
      subject = Plugin.new({})

      result = subject.rules(LintRoller::Context.new)

      rules_value = begin
        YAML.load_file(Pathname.new(__dir__).join("../../../config/base.yml"), aliases: true)
      rescue ArgumentError
        YAML.load_file(Pathname.new(__dir__).join("../../../config/base.yml"))
      end

      assert_equal(LintRoller::Rules.new(
        type: :object,
        config_format: :rubocop,
        value: rules_value
      ), result)
    end
  end
end
