class Row

  attr :path, :ip

  def initialize(row_string)
    parse_string!(row_string)
  end

  private

  def parse_string!(string)
    match = /(\S+) ([\d.]+)/.match(string)
    @path = match[1]
    @ip = match[2]
  end
end
