class InvoiceController < ApplicationController
    getter invoice = Invoice.new
    
    before_action do
      only [:show, :edit, :update, :destroy] { set_invoice }
    end

    def index
      invoices = Invoice.all
      # providers = Invoice.all("WHERE user_type_id = 1")
      # customers = Invoice.all("WHERE user_type_id = 2")
      render "index.ecr"
    end
  
    def show
      render "show.ecr"
    end
  
    def new
      users = User.all
      render "new.ecr"
    end
  
    def edit
      users = User.all
      render "edit.ecr"
    end
  
    def create
        users = User.all
        invoice = Invoice.new invoice_params.validate!
      if invoice.save
        redirect_back(flash: {"success" => "Création effectuée"})
      else
        flash[:danger] = "Could not create Invoice!"
        render "new.ecr"
      end
    end
  
    def update
        users = User.all
        invoice.set_attributes invoice_params.validate!
      if invoice.save
        redirect_back(flash: {"success" => "Edition effectuée"})
      else
        flash[:danger] = "Could not update Invoice!"
        render "edit.ecr"
      end
    end
  
    def destroy
      invoice.destroy
      redirect_to controller: :home, action: :index, flash: {"success" => "Suppression effectuée"}
    end

    private def invoice_params
    params.validation do
      required :name
      optional :amount
      optional :tva
      optional :type
      optional :date
      optional :paid
      optional :user_id
      optional :payment_method_id
        end
    end

    private def set_invoice
        @invoice = Invoice.find! params[:id]
    end
end