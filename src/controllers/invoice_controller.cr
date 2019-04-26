class InvoiceController < ApplicationController
    getter invoice = Invoice.new
    getter year = Invoice.new
    
    before_action do
      only [:show, :edit, :update, :destroy] { set_invoice }
      only [:show_year] { set_year }
    end

    def category_filter
      invoices = Invoice.all("WHERE type LIKE (?) AND paid = ? AND YEAR(date) = ? AND MONTH(date) = ?", [params[:c],params[:p],params[:y],params[:m]] )
      respond_with do
        json invoices.to_json
      end
    end

    def index
      invoices = Invoice.all("WHERE paid = false")
      render "index.ecr"
    end
  
    def show
      render "show.ecr"
    end

    def year
      years = Invoice.all("GROUP BY YEAR(date)")
      render "year.ecr"
    end

    def show_year
      months = Invoice.all("WHERE YEAR(date) = ? GROUP BY MONTH(date)", params[:year])
      render "show_year.ecr"
    end

    def show_month
      invoices = Invoice.all("WHERE YEAR(date) = ? AND MONTH(date) = ? ORDER BY date DESC", [params[:year],params[:month]])
      render "show_month.ecr"
    end

    def current_month
      invoices = Invoice.all("WHERE YEAR(date) = YEAR(now()) AND MONTH(date) = MONTH(now())")
      render "show_month.ecr"
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
        redirect_to location: "/months/" + invoice.date!.to_s("%Y") + "/" + invoice.date!.to_s("%m"), flash: {"success" => "Création effectuée"}
      else
        redirect_to action: :new, flash: {"danger" => "Could not create Invoice!"}
      end
    end
  
    def update
        invoice.set_attributes invoice_params.validate!
        invoice.date = Time.parse(params[:date], "%Y-%m-%d", Time::Location::UTC)
      if invoice.save
        redirect_to location: "/months/" + invoice.date!.to_s("%Y") + "/" + invoice.date!.to_s("%m"), flash: {"success" => "Edition effectuée"}
      else
        redirect_to action: :edit, flash: {"danger" => "Could not edit Invoice!"}
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

    private def set_year
        @year = Invoice.first!("WHERE YEAR(date) = ?", params[:year])
    end
end