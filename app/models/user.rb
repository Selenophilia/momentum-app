class User < ApplicationRecord

has_secure_password

validates :username, presence:true  
validates :username, uniqueness:true
validates :email, presence: true 
validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
               message: "Email invalid"  },uniqueness: { case_sensitive: false },
               length: { minimum: 4, maximum: 254 }
end
