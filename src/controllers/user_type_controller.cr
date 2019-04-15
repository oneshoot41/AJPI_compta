class UserTypeController < ApplicationController
    getter user_type = UserType.new
    
    before_action do
      only [:show, :edit, :update, :destroy] { set_user_type }
    end

    def index
      user_types = UserType.all
      render "index.ecr"
    end
  
    def show
      render "show.ecr"
    end
  
    def new
      render "new.ecr"
    end
  
    def edit
      render "edit.ecr"
    end
  
    def create
        user_type = UserType.new user_type_params.validate!
      if user_type.save
        redirect_back(flash: {"success" => "Création effectuée"})
      else
        flash[:danger] = "Could not create UserType!"
        render "new.ecr"
      end
    end
  
    def update
        user_type.set_attributes user_type_params.validate!
      if user_type.save
        redirect_back(flash: {"success" => "Edition effectuée"})
      else
        flash[:danger] = "Could not update UserType!"
        render "edit.ecr"
      end
    end
  
    def destroy
      user_type.destroy
      redirect_to controller: :home, action: :index, flash: {"success" => "Suppression effectuée"}
    end

    private def user_type_params
    params.validation do
      required :wording
        end
    end

    private def set_user_type
        @user_type = UserType.find! params[:id]
    end
end
