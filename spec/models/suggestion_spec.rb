require "rails_helper"

describe Suggestion do
  context "validations" do
    it "is valid" do
      expect(FactoryGirl.build(:suggestion)).to be_valid
    end
    it "is invalid" do
      expect(FactoryGirl.build(:suggestion, buzzword: "")).to be_invalid
    end
  end

  context "result" do
    let(:suggestion) { FactoryGirl.build(:suggestion) }

    before do
      # First domain is unavailable, second is available
      expect(Whois).to receive(:whois).once.and_return(double(available?: false))
      expect(Whois).to receive(:whois).once.and_return(double(available?: true))
    end

    it "randomizes until available domain is found" do
      expect(suggestion).to receive(:build_fqdn).twice.and_call_original
      suggestion.result
    end
  end
end
