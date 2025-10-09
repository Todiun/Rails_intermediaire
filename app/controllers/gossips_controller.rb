class GossipsController < ApplicationController
  
  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    # On crée un nouvel objet Gossip avec les données du formulaire
    @gossip = Gossip.new(
      title: params[:title],
      content: params[:content],
      author: User.find_by(first_name: "anonymous") # L’auteur “anonymous”
    )

    if @gossip.save
      flash[:notice] = "Le potin a été créé avec succès 🎉"
      redirect_to root_path
    else
      flash[:alert] = "Erreur : le potin n'a pas pu être créé 😢"
      render :new
    end
  end
end
