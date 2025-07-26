require 'net/http'
require 'json'

class UserBooksController < ApplicationController

    #ユーザの本一覧
    def index
        @user_books=UserBook.where(user_id:current_user.id).order(created_at: :desc)
        isbns=@user_books.pluck(:isbn)
        @books=Book.where(isbn:isbns).index_by(&:isbn).values_at(*isbns)
        puts "current:::#{current_user}"
        render json: {'本の一覧': @books}  
    end


    #ユーザの本を追加
    def create
        puts cookies
        puts "クッキーの確認:#{cookies[:auth_token]}"
        puts cookies[:auth_token] 
        book_isbn=params[:isbn].to_s.gsub("-","")
        EditUserBooks.create(current_user.id,book_isbn)
        render json: { message: "登録成功しました" }, status: :ok
    end

    #ユーザの本を削除
    def destroy
        isbn=params[:id].to_s.gsub("-","")
        puts "削除しました。"
        EditUserBooks.delete(current_user.id,isbn)
        render json: { message: "削除しました" }, status: :ok
    end

    #ユーザが任意の本を持っているか判定する
    def exists
        isbn=params[:isbn].to_s.gsub("-","")
        puts ("かれんとゆーざー：#{current_user}")
        has_book = UserBook.exists?(isbn: isbn, user_id: current_user.id)
        render json:{"has_book":has_book}
        
    end
end
