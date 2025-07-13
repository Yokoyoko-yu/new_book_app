#ユーザ情報
class User < ApplicationRecord
    has_many :user_books
    before_save{self.email=email.downcase}
    before_save{self.password=password.downcase}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name,presence: true,length: {maximum:9}
    validates :email,presence: true,uniqueness: true,length: {minimum:6,maximum:30},format: {with:VALID_EMAIL_REGEX}
    has_secure_password
    validates :password,presence: true,length: {minimum:6,maximum:255}
end
