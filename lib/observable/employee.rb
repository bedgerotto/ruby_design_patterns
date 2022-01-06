# frozen_string_literal: true

require "observer"

class Employee
  attr_reader :name, :title, :salary

  include Observable
  # include Subject

  def initialize(name:, title:, salary:)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def title=(new_title)
    return if @title == new_title

    @title = new_title
  end

  def salary=(new_salary)
    return if @salary == new_salary

    @salary = new_salary
  end

  def changes_complete
    changed
    notify_observers self
  end
end
