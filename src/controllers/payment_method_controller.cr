class PaymentMethodController < ApplicationController
    getter payment_method = PaymentMethod.new
    
    before_action do
      only [:show, :edit, :update, :destroy] { set_payment_method }
    end

    def index
      payment_methods = PaymentMethod.all
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
        payment_method = PaymentMethod.new payment_method_params.validate!
      if payment_method.save
        redirect_to action: :index, flash: {"success" => "Création effectuée"}
      else
        redirect_to action: :edit, flash: {"danger" => "Impossible de créer, veuillez réessayer"}
      end
    end
  
    def update
        payment_method.set_attributes payment_method_params.validate!
      if payment_method.save
        redirect_to action: :index, flash: {"success" => "Edition effectuée"}
      else
        redirect_to action: :edit, flash: {"danger" => "Impossible d'éditer, veuillez réessayer"}
      end
    end
  
    def destroy
      payment_method.destroy
      redirect_to controller: :home, action: :index, flash: {"success" => "Suppression effectuée"}
    end

    private def payment_method_params
    params.validation do
      required :wording
        end
    end

    private def set_payment_method
        @payment_method = PaymentMethod.find! params[:id]
    end
end
