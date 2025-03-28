class LiteraryAwardsController < ApplicationController
    #賞の一覧を見る
    def show    
        @awards=LiteraryAward.all
        puts @awards
        render json:{awards:@awards}
    end

    def check
        @award=LiteraryAward.find(params[:id])
        @award_num=AwardBook.where(literary_award_id: params[:id])
        @award_books = AwardBook.where(literary_award_id: params[:id]).order(times: :desc)
        @my_books=MyBook.where(user_id:current_user.id)
        @read_awards=0
        @have_awards=0
        @award_num.each do |book|
            if book=MyBook.find_by(title: book.title,user_id:current_user)
                if book.read==1
                    @read_awards+=1
                end
                if book.have==1
                    @have_awards+=1
                end
            end
        end
      
        render json:{books:@award_books}
        # @read_awards=ActiveRecord::Base.connection.execute("select * from MyBook where MyBook")
        # @have_awards=MyBook.joins(:award_book).select("my_books.*").where(user_id: current_user.id, read: 0).where("my_books.title = award_books.title")
    end

    def have_book
        if @book=AwardBook.find(params[:id])
            #既に追加されている場合
            if book=MyBook.find_by(title:@book.title,user_id:current_user)
                book.update(have:1)
                redirect_to check_path(id:params[:current_page_id])
            #新たに追加する場合
            else
                my_book=MyBook.new(title:@book.title,author:@book.author,user_id:current_user.id,read:0,have:1)
                if my_book.save
                    redirect_to check_path(id:params[:current_page_id])
                else
                    @award=LiteraryAward.find(@book.literary_award_id)
                    @award_books = AwardBook.where(literary_award_id: @award.id).order(times: :desc)
                    logger.error my_book.errors.full_messages.join(", ")  # ここでエラーメッセージをログに出力  
                    render 'check',status: :unprocessable_entity
                end
            end
        else
            render 'show',status: :unprocessable_entity
        end
    end

    def read_book
        if @book=AwardBook.find(params[:id])
            #既に追加されている場合
            if book=MyBook.find_by(title:@book.title,user_id:current_user)
                book.update(read:1)
                redirect_to check_path(id:params[:current_page_id])
            #新たに追加する場合
            else
                my_book=MyBook.new(title:@book.title,author:@book.author,user_id:current_user.id,read:1,have:0)
                if my_book.save
                    redirect_to check_path(id:params[:current_page_id])
                else
                    @award=LiteraryAward.find(@book.literary_award_id)
                    @award_books = AwardBook.where(literary_award_id: @award.id).order(times: :desc)
                    logger.error my_book.errors.full_messages.join(", ")  # ここでエラーメッセージをログに出力  
                    render 'check',status: :unprocessable_entity
                end
            end
        else
            render 'show',status: :unprocessable_entity
        end
    end
end
