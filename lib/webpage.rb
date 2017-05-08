require 'set'

class Webpage

  attr :path

  def initialize(path)
    @path = path
  end

  def total_views
    ips.size
  end

  def uniq_views
    uniq_ips.size
  end

  def view(ip)
    ips << ip
    uniq_ips << ip
  end

  private

  def ips
    @ips ||= []
  end

  def uniq_ips
    @uniq_ips ||= Set.new
  end
end
