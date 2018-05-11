require_relative "../lib/StarTrekCLI/series.rb"

describe Series do
  let(:a_series) { Series.new("Foo") }

  # we do not care *what* the series name is!
  it "can initialize a series" do
    expect(a_series).to be_a(Series)
  end

  # we care about name
  it "initializes with a name" do
    voyager = Series.new("Voyager")
    expect(voyager.name).to eq("Voyager")
  end

  it "initializes seasons as empty" do
    expect(a_series.seasons).to be_empty
  end

  it "initializes with a seasons array" do
    expect(a_series.seasons).to be_a(Array)
  end

  # check attr_reader
  it "does not allow you to change its name" do
    expect { a_series.name = "Empire Strikes Back" }.to raise_error NoMethodError
  end

  describe "#seasons" do

    # we do not care about what series it is
    it "can be called" do
      expect { a_series.seasons }.not_to raise_error NoMethodError
    end

    # we do not care about the specific series
    it "does return nil if there are no seasons" do
      expect(a_series.seasons).to be_nil
    end

    it "actually sets the season int"


  end # Series#seasons

end # Series
