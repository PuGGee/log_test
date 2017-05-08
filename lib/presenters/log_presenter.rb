module Presenters
  class LogPresenter

    def initialize(log_file)
      @log_file = log_file
    end

    def present_total_views
      pages.sort_by(&:total_views).reverse.map do |page|
        "#{page.path} #{page.total_views} visits"
      end.join("\n")
    end

    def present_uniq_views
      pages.sort_by(&:uniq_views).reverse.map do |page|
        "#{page.path} #{page.uniq_views} unique visits"
      end.join("\n")
    end

    private

    attr :log_file

    def pages
      log_file.pages
    end
  end
end
