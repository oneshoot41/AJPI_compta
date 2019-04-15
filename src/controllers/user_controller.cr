class UserController < ApplicationController
    getter user = User.new
    
    before_action do
      only [:show, :edit, :update, :destroy] { set_user }
    end

    def index
      providers = User.all("WHERE user_type_id = 1")
      customers = User.all("WHERE user_type_id = 2")
      render "index.ecr"
    end
  
    def show
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
        redirect_back(flash: {"success" => "Création effectuée"})
      else
        flash[:danger] = "Could not create User!"
        render "new.ecr"
      end
    end
  
    def update
        user_types = UserType.all
        user.set_attributes user_params.validate!
      if user.save
        redirect_back(flash: {"success" => "Edition effectuée"})
      else
        flash[:danger] = "Could not update User!"
        render "edit.ecr"
      end
    end
  
    def destroy
      user.destroy
      redirect_to controller: :home, action: :index, flash: {"success" => "Suppression effectuée"}
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
