class User < Granite::Base
  adapter mysql
  table_name users

  has_many invoices : Invoice
  belongs_to :user_type

  primary id : Int64
  field name : String
  timestamps
end
