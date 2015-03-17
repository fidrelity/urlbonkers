class SuggestionsController < ApplicationController

  def index
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    if @suggestion.invalid?
      flash[:error] = @suggestion.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:buzzword)
  end
end
