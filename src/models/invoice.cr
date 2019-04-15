class Invoice < Granite::Base
  adapter mysql
  table_name invoices

  belongs_to :user
  belongs_to :payment_method

  primary id : Int64
  field name : String
  field amount : Float32
  field tva : Float32
  field type : String
  field date : Time
  field paid : Bool
  timestamps
end
