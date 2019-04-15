class PaymentMethod < Granite::Base
  adapter mysql
  table_name payment_methods

  has_many invoices : Invoice

  primary id : Int64
  field wording : String
  timestamps
end
