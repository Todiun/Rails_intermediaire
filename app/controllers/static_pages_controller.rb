class StaticPagesController < ApplicationController
  def home
    @gossips = Gossip.all.includes(:author)
  end

  def welcome
    @first_name = params[:first_name]
  end

  def team
  end

  def contact
  end
end
