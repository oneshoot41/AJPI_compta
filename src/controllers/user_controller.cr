class UserController < ApplicationController
    getter user = User.new
    
    before_action do
      only [:show, :edit, :update, :destroy] { set_user }
    end

    def index
      user_types = UserType.all
      render "index.ecr"
    end
  
    def show
      invoices = Invoice.all("WHERE user_id = ?", params[:id])
      render "show.ecr"
    end
  
    def new
      user_types = UserType.all
      render "new.ecr"
    end
  
    def edit
      user_types = UserType.all
      render "edit.ecr"
    end
  
    def create
        user_types = UserType.all
        user = User.new user_params.validate!
      if user.save
        redirect_to action: :index, flash: {"success" => "Création effectuée"}
      else
        redirect_to action: :edit, flash: {"danger" => "Impossible de créer, veuillez réessayer"}
      end
    end
  
    def update
        user_types = UserType.all
        user.set_attributes user_params.validate!
      if user.save
        redirect_to action: :index, flash: {"success" => "Edition effectuée"}
      else
        redirect_to action: :edit, flash: {"danger" => "Impossible d'éditer, veuillez réessayer"}
      end
    end
  
    def destroy
      user.destroy
      redirect_to action: :index, flash: {"success" => "Suppression effectuée"}
    end

    private def user_params
    params.validation do
      required :name
      optional :user_type_id
        end
    end

    private def set_user
        @user = User.find! params[:id]
    end
end
