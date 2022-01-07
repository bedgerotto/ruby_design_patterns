# frozen_string_literal: true

class CompositeTask < Task
  attr_reader :sub_tasks

  def initialize(name)
    super name
    @sub_tasks = []
  end

  def <<(task)
    sub_tasks << task
    task.parent = self
  end

  def [](index)
    sub_tasks[index]
  end

  def []=(index, new_value)
    sub_tasks[index] = new_value
  end

  def remove_sub_task(task)
    sub_tasks.remove task
    task.parent = nil
  end

  def time_required
    sub_tasks.map { _1.time_required }.sum
  end

  def total_number_basic_tasks
    sub_tasks.map { _1.total_number_basic_tasks }.sum
  end
end
