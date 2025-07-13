class EditUserBooks
    #ユーザの書籍を登録する関数
    def self.create(user_id,isbn)
        info=FetchBookData.fetch(isbn)
        book=Book.new(isbn:info[:isbn],author:info[:author],title:info[:title],publisher:info[:publisher])
        if !Book.find_by(isbn:isbn)
            book.save
        end

        user_book=UserBook.new(user_id:user_id,isbn:isbn)
        user_book.save!
        user_book
    end
    #ユーザの書籍登録を削除する関数
    def self.delete(user_id,isbn)
        user_book=UserBook.find_by(user_id:user_id,isbn:isbn)
        if user_book
            user_book.delete
            puts "ok!!"
        else
            puts "no"
        end

    end
end
