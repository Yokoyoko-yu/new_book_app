class FetchBooksTableData
    def self.fetch(award_title_id)
        award_book_contents=Book.find_by_sql(<<-SQL)
        SELECT books.isbn,books.title,books.author,books.publisher
        from books 
        join award_book_contents on award_book_contents.isbn=books.isbn
        where award_book_contents.award_title_id=#{award_title_id};
        SQL
        award_book_contents
    end
end