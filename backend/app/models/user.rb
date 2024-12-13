class User < ApplicationRecord
    has_many :my_books
    before_save{self.email=email.downcase}
    validates :name,presence: true,length:{maximum:255}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,presence: true,length:{minimum:6,maximum:255},uniqueness:true,format:{with:VALID_EMAIL_REGEX}
    has_secure_password
    validates :password,presence:true,length:{minimum:6}
end
