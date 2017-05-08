require './lib/row'
require './lib/collections/webpage_collection'

class LogFile

  def initialize(path)
    @path = path
  end

  def pages
    @pages ||= parse_file.pages
  end

  private

  attr :path

  def parse_file
    File.open(path) do |file|
      file.each_line.each_with_object(Collections::WebpageCollection.new) do |line, collection|
        add_row_to_collection(Row.new(line), collection)
      end
    end
  end

  def add_row_to_collection(row, collection)
    add_view_to_page(collection.page(row.path), row.ip)
  end

  def add_view_to_page(page, ip)
    page.view(ip)
  end
end
