require './lib/webpage'

module Collections
  class WebpageCollection

    def pages
      pages_hash.values
    end

    def page(path)
      pages_hash[path] ||= Webpage.new(path)
    end

    private

    def pages_hash
      @pages_hash ||= {}
    end
  end
end
