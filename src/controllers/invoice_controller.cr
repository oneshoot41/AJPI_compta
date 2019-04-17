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
      date = Time.now
      providers = User.all("WHERE user_type_id = 1")
      customers = User.all("WHERE user_type_id = 2")
      payment_methods = PaymentMethod.all
      render "new.ecr"
    end
  
    def edit
      date = Time.now
      providers = User.all("WHERE user_type_id = 1")
      customers = User.all("WHERE user_type_id = 2")
      payment_methods = PaymentMethod.all
      render "edit.ecr"
    end
  
    def create
        invoice = Invoice.new invoice_params.validate!
        invoice.date = Time.parse(params[:date], "%Y-%m-%d", Time::Location::UTC)
      if invoice.save
        redirect_to action: :index, flash: {"success" => "Création effectuée"}
      else
        redirect_to action: :new, flash: {"danger" => "Could not create Invoice!"}
      end
    end
  
    def update
        invoice.set_attributes invoice_params.validate!
        invoice.date = Time.parse(params[:date], "%Y-%m-%d", Time::Location::UTC)
      if invoice.save
        redirect_to action: :index, flash: {"success" => "Edition effectuée"}
      else
        redirect_to action: :edit, flash: {"danger" => "Could not edit Invoice!"}
      end
    end
  
    def destroy
      invoice.destroy
      redirect_to action: :index, flash: {"success" => "Suppression effectuée"}
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