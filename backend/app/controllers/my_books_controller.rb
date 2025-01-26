class MyBooksController < ApplicationController
    include SessionsHelper
    # def new
    #     @my_book=MyBook.new
    # end
    def show
        @user=current_user
        # @user=User.find(params[:id])
        @my_books=@user.my_books
        render json:{books:@my_books}
        # @my_books_read=@user.my_books.where(read: 1).order(id: :asc)
        # @my_books_unread=@user.my_books.where(read: 0).order(id: :asc)
    end
    def create
        puts 'aaa'
        puts params
        @my_book =current_user.my_books.new(my_book_params)
        @my_book.read||=0
        if @my_book.save
            puts("mybook:#{@my_book}")
            # redirect_to my_book_path(@current_user)
            render json: { message: 'Book created successfully' }, status: :ok
        else
            render 'new',status: :unprocessable_entity
        end
    end

    def index
        puts "indexが呼び出されましたよ"
        puts "クッキーの値: #{cookies[:auth_token]}"
        @user=current_user
        if @user.nil?
            puts "nilだよ"
        else
            puts "nilじゃないよ"
        end
        puts "-----------#{@user}"
        puts('ajflasfksajfdsj')
        @my_books=@user.my_books
        puts "私の本は#{@my_books}"
        render json:{books:@my_books}
    end

    def destroy
        @my_book=MyBook.find(params[:id])
        if @my_book
            @my_book.destroy
            redirect_to my_book_path(current_user),status:200
        else
            redirect_to new_my_book_path,status: :unprocessable_entity
        end
    end

    def finish
        @book=MyBook.find(params[:id])
        if @book
            @book.update(read:1)
            redirect_to my_book_path(current_user)
        else
            render 'show',status: :unprocessable_entity
        end
    end

    
    private
    def my_book_params
        params.require(:my_book).permit(:title,:author,:read,:isbn,:image)
    end
end
