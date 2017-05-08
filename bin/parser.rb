require './lib/log_file'
require './lib/presenters/log_presenter'

class Parser

  def initialize(log_path)
    @log_path = log_path
  end

  def run
    puts presenter.present_total_views
    puts
    puts presenter.present_uniq_views
  end

  private

  attr :log_path

  def presenter
    @presenter ||= Presenters::LogPresenter.new(LogFile.new(log_path))
  end
end

Parser.new(ARGV[0]).run
