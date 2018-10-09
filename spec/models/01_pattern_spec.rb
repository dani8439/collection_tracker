require 'spec_helper'

describe "Pattern" do
  before do
    @pattern = Pattern.create(:name => "Love & Kisses", :theme => "Pinks")

    small_jug = Piece.create(:name => "Jug", :size => "1.5 Pint", :quantity => "1")

    small_jug.patterns << @pattern
  end

  it "can be initialized" do
    expect(@pattern).to be_an_instance_of(Pattern)
  end

  it "can have a name" do
    expect(@pattern.name).to eq("Love & Kisses")
  end

  it "can have a theme" do
    expect(@pattern.theme).to eq("Pinks")
  end

  it "has many pieces" do
    expect(@pattern.pieces.count).to eq(1)
  end

  it "allows you to view form to create a new pattern" do
    visit '/patterns/new'
    expect(page.body).to include('<form')
    expect(page.body).to include('pattern[theme]')
    expect(page.body).to include('pattern[name]')
  end

  it "allows you to list all patterns" do
    visit '/patterns'

    expect(page.status_code).to eq(200)

    expect(page.body).to include("Starry Skies")
    expect(page.body).to include("Utility")
  end

end
