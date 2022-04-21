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
end

