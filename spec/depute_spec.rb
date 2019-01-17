require_relative '../lib/depute'

describe "return something with the scraper" do
  it "should return result no nil " do
    expect(loadfile).not_to be_nil
  end
end
  describe "return something with the scraper" do
    it "should return result 1 " do
      expect(loadfile).to eq(1)
    end


end
