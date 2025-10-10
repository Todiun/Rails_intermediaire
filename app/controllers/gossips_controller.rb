class GossipsController < ApplicationController
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @gossip = Gossip.new
  end

  def create
    anonymous_user = User.find_or_create_by(first_name: "anonymous") do |u|
      u.last_name = "user"
      u.email = "anonymous@example.com"
      u.city = City.first || City.create(name: "Paris", zip_code: "75000")
    end

    @gossip = Gossip.new(
      title: params[:title],
      content: params[:content],
      author: anonymous_user
    )

    if @gossip.save
      flash[:notice] = "Le potin a été créé avec succès 🎉"
      redirect_to root_path
    else
      flash[:alert] = "Erreur : le potin n'a pas pu être créé 😢"
      render :new
    end
  end

  def edit; end

  def update
    if @gossip.update(title: params[:title], content: params[:content])
      flash[:notice] = "Le potin a été mis à jour avec succès 🎉"
      redirect_to @gossip
    else
      flash.now[:alert] = "Erreur : la mise à jour a échoué 😢"
      render :edit
    end
  end

  def destroy
    @gossip.destroy
    redirect_to root_path, notice: "Le potin a été supprimé 🗑️"
  end

  private

  def set_gossip
    @gossip = Gossip.find(params[:id])
  end
end
