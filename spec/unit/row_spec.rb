require './lib/row'

describe Row do

  context "given a line from the log file" do

    let(:row) { Row.new("/contact 200.017.277.774") }

    it "should find the path and ip" do
      expect(row.path).to eq '/contact'
      expect(row.ip).to eq '200.017.277.774'
    end
  end
end
