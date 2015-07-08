require 'rspec'
require 'httparty'

describe "DOI url redirect test" do
  it "should redirect a DOI url to the correct article" do
     response = HTTParty.get "http://www.nature.com/articles/doi:10.1038/ncomms8563"
     directed_url = response.request.last_uri.to_s

     expect(directed_url).to include("ncomms8563/full/ncomms8563.html")
     expect(response.success?).to be true
  end
end
