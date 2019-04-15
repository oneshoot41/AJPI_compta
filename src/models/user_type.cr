class UserType < Granite::Base
  adapter mysql
  table_name user_types

  has_many users : User

  primary id : Int64
  field wording : String
  timestamps
end
