# frozen_string_literal: true

interpreter_folder = File.join(File.dirname(__FILE__), '../interpreter/*.rb')
Dir.glob(interpreter_folder).sort.each(&method(:require))

class Backup
  attr_accessor :backup_directory
  attr_reader :data_sources

  def initialize
    @backup_directory = "/backup"
    @interval = 60
    @data_sources = []
    yield(self) if block_given?
    PackRat.instance.register_backup(self)
  end

  def backup(dir, find_expression = All.new)
    @data_sources << DataSource.new(dir, find_expression)
  end

  def to(backup_directory)
    @backup_directory = backup_directory
  end

  def file_name(pattern)
    FileName.new(pattern)
  end

  def except(pattern)
    Not.new(FileName.new(pattern))
  end

  def interval(minutes)
    @interval = minutes
  end

  def backup_files
    this_backup_dir = Time.new.ctime.tr(':', '_')
    this_backup_path = File.join(backup_directory, this_backup_dir)

    @data_sources.each { |source| source.backup(this_backup_path) }
  end

  def run
    Kernel.loop do
      puts "Starting the backup"
      backup_files
      puts "Backup ended"
      sleep(@interval * 60)
    end
  end
end
