class VotesController < ApplicationController
  def create

    @context = context
    @vote = @context.votes.new
    @vote.total = 0

    if @vote.save
      redirect_to vote_url(context)
    end
  end

end
