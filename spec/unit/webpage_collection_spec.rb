require './lib/collections/webpage_collection'

describe Collections::WebpageCollection do

  context "given a list of pages containing some duplicates" do

    let(:webpage_collection) { Collections::WebpageCollection.new }

    it "should only save unique pages" do

      webpage_collection.page('/page1')
      webpage_collection.page('/page1')
      webpage_collection.page('/page2')

      expect(webpage_collection.pages.size).to eq 2
    end
  end
end
