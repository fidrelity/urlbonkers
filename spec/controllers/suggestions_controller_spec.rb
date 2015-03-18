require 'rails_helper'

RSpec.describe SuggestionsController, type: :controller do

  describe "#create" do
    subject { post :create, suggestion: { buzzword: "batman" } }

    it "renders create for valid buzzword" do
      expect(subject).to render_template(:create)
    end
  end

  describe "#create" do
    subject { post :create, suggestion: { buzzword: "" } }

    it "renders index for empty buzzword" do
      expect(subject).to render_template(:index)
    end
  end
end
