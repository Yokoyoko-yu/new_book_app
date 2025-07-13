class FetchUserAwardBooks
    def self.fetch(user_id,award_id)
        user_award_book=Award.find_by_sql(<<-SQL)
        SELECT 
        awards.name,
        award_grants.times,
        award_titles.title,
        award_titles.author,
        award_titles.id,
        EXISTS (
            SELECT 1
            FROM award_book_contents
            JOIN books ON books.isbn = award_book_contents.isbn
            JOIN user_books ON user_books.isbn = books.isbn
            WHERE award_book_contents.award_title_id = award_titles.id
            AND user_books.user_id = #{user_id}
        ) AS has_book
        FROM awards
        JOIN award_grants ON award_grants.award_id = awards.id
        JOIN award_titles ON award_titles.id = award_grants.award_title_id
        WHERE awards.id = #{award_id};

        SQL
        user_award_book
    end
end

#回数、本のタイトル、著者、ユーザは所持しているかどうか