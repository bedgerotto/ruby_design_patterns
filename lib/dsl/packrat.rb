# frozen_string_literal: true

require "find"
require "singleton"
require_relative "./backup"
require_relative "./data_source"

class PackRat
  include Singleton

  def initialize
    @backups = []
  end

  def register_backup(backup)
    @backups << backup
  end

  def run
    threads = []
    @backups.each do |backup|
      threads << Thread.new { backup.run }
    end

    threads.each(&:join)
  rescue Interrupt
    puts "byebye"
  end
end

eval File.read('backup.pr')
PackRat.instance.run
