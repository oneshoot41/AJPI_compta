Amber::Server.configure do
  pipeline :web do
    # Plug is the method to use connect a pipe (middleware)
    # A plug accepts an instance of HTTP::Handler
    plug Amber::Pipe::PoweredByAmber.new
    # plug Amber::Pipe::ClientIp.new(["X-Forwarded-For"])
    plug Citrine::I18n::Handler.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    plug Amber::Pipe::Flash.new
    plug Amber::Pipe::CSRF.new
  end

  pipeline :api do
    plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    plug Amber::Pipe::CORS.new
  end

  # All static content will run these transformations
  pipeline :static do
    plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Static.new("./public")
  end

  routes :web do
    get "/year_historic/:fmonths/:fmonthe/:fyear/:lmonths/:lmonthe/:lyear", HomeController, :year
    get "/year_historic", HomeController, :year_historic 
    get "/quarter/:start/:end/:year", HomeController, :quarter
    get "/quarter_historic", HomeController, :quarter_historic
    get "/invoice_category/json", InvoiceController, :category_filter
    resources "/payment_methods", PaymentMethodController
    get "/years", InvoiceController, :year
    get "/years/:year", InvoiceController, :show_year
    get "/months/:year/:month", InvoiceController, :show_month
    resources "/invoices", InvoiceController
    resources "/user_types", UserTypeController
    resources "/users", UserController
    get "/", HomeController, :index
  end

  routes :api do
  end

  routes :static do
    # Each route is defined as follow
    # verb resource : String, controller : Symbol, action : Symbol
    get "/*", Amber::Controller::Static, :index
  end
end
