class User < ApplicationRecord
  has_many :user_apps 
  
 
  def check_password(to_check)
     #if to_check == "foo"
     if self.password == to_check
         return true  
     end
     return false
  end

end
