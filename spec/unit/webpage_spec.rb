require './lib/webpage'

describe Webpage do

  context "given a list of ip addresses" do

    let(:webpage) { Webpage.new('/contact') }
    let(:ip1) { "200.017.277.774" }
    let(:ip2) { "836.973.694.403" }

    it "should calculate total views" do
      webpage.view(ip1)
      webpage.view(ip1)
      webpage.view(ip2)

      expect(webpage.total_views).to eq 3
    end

    it "should calculate unique views" do
      webpage.view(ip1)
      webpage.view(ip1)
      webpage.view(ip2)
      webpage.view(ip2)

      expect(webpage.uniq_views).to eq 2
    end
  end
end
