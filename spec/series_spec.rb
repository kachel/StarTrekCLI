require_relative "../lib/StarTrekCLI/series.rb"

describe Series do

  let(:series) { Series.new("Voyager") }

  it "can initialize a series" do
    expect(series).to be_a(Series)
  end

  it "initializes with a name" do
    expect(series.name).to eq("Voyager")
  end

  it "does not allow you to change its name" do
    expect { series.name = "Empire Strikes Back" }.to raise_error NoMethodError
  end

  describe "#seasons" do
      let(:series) { Series.new("Voyager") }

    it "can be called" do
      expect { series.seasons }.not_to raise_error NoMethodError
    end

    it "does return nil if there are no seasons" do
      expect(series.seasons).to be_nil
    end


  end # Series#seasons

end
