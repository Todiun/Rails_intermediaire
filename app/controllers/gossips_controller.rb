class GossipsController < ApplicationController
  
  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    # On récupère (ou crée) l'utilisateur "anonymous" pour éviter les erreurs
    anonymous_user = User.find_or_create_by(first_name: "anonymous") do |u|
      u.last_name = "user"
      u.email = "anonymous@example.com"
      u.city = City.first || City.create(name: "Paris", zip_code: "75000")
    end

    # On crée le nouveau potin
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
end