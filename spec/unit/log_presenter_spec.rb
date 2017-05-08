require './lib/presenters/log_presenter'

class MockReader

  def pages
    [
      Page.new('/page1', 1, 3),
      Page.new('/page2', 2, 1),
      Page.new('/page3', 3, 2),
    ]
  end

  class Page < Struct.new(:path, :total_views, :uniq_views)
  end
end

describe Presenters::LogPresenter do

  context "when given a reader that responds to #pages" do

    let(:log_presenter) { Presenters::LogPresenter.new(MockReader.new) }

    it "should return a list of total page views" do
      expect(log_presenter.present_total_views).to eq([
        '/page3 3 visits',
        '/page2 2 visits',
        '/page1 1 visits',
      ].join("\n"))
    end

    it "should return a list of total page views" do
      expect(log_presenter.present_uniq_views).to eq([
        '/page1 3 unique visits',
        '/page3 2 unique visits',
        '/page2 1 unique visits',
      ].join("\n"))
    end
  end
end
