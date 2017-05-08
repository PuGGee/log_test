require './lib/log_file'

describe LogFile do

  context "when given a path to a valid log file" do

    let(:log_file) { LogFile.new('./spec/data/test_log.txt') }

    it "should generate the correct number of pages" do
      expect(log_file.pages.size).to eq 3
    end
  end
end
