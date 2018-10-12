require 'spec_helper'

describe "Piece" do
  before do
    @piece = Piece.create(:name => "Jug", :size => "1.5 Pint")

    @pattern = Pattern.create(:name => "Love & Kisses", :quantity => "20")

    @pattern.pieces << @piece

    @piece.pattern_ids = @pattern.id
  end

  it "can initialize a piece" do
    expect(Piece.new).to be_an_instance_of(Piece)
  end

  it "can have a name" do
    expect(@piece.name).to eq("Jug")
  end

  it "can have a size" do
    expect(@piece.size).to eq("1.5 Pint")
  end

  it "can have many patterns" do
    expect(@piece.patterns.count).to eq(1)
  end
end
