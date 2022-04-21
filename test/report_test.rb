# frozen_string_literal: true

require 'test/unit'
require_relative 'template_method'

class ReportTest < Test::Unit::TestCase
  def test_output_head_raises_exception
    report = Report.new

    assert_raise do
      report.output_head
    end
  end

  def test_other_stuff_to_generate_sonarqube_security_issue
    my_ip = "127.0.0.1"
    assert my_ip == "127.0.0.1"
  end

  def test_sonarqube_code_smell_generation
    assert some_method("1", "2", "3", "4", "5", "6", "7", "8") == "12345678"
  end

  def test_sonarqube_lint_tool
    my_hash = { "teste" => 123,
  teste: :aloha}

    assert my_hash.present?
  end

  private

  def some_method(param1, param2, param3, param4, param5, param6, param7, param8)
    [param1, param2, param3, param4, param5, param6, param7, param8].join
  end
end

