require 'net/http'
require 'json'

class UserBooksController < ApplicationController

    #ユーザの本一覧
    def index
        @user_books=UserBook.where(user_id:current_user.id)
        isbns=@user_books.pluck(:isbn)
        @books=Book.where(isbn:isbns)
        render json: {'本の一覧': @books}  
    end


    #ユーザの本を追加
    def create
        puts cookies
        puts "クッキーの確認:#{cookies[:auth_token]}"
        puts cookies[:auth_token] 
        book_isbn=params[:isbn].to_s.gsub("-","")
        EditUserBooks.create(current_user.id,book_isbn)
    end

    #ユーザの本を削除
    def destroy
        isbn=params[:id].to_s.gsub("-","")
        EditUserBooks.delete(current_user.id,isbn)
    end
end
