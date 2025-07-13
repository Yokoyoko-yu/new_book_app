class BooksController < ApplicationController
    # def create(isbn)
    #     isbn=isbn.gsub('-')
    #     uri = URI("https://api.openbd.jp/v1/get?isbn=#{isbn}")
    #     res = Net::HTTP.get(uri)
    #     json = JSON.parse(res)
    #     book_info=json[0]["summary"]
    #     author=book_info["author"]
    #     title=book_info["title"]
    #     publisher=book_info["publisher"]
    #     book=Book.new(isbn:isbn,author:author,title:title,publisher:publisher)
    #     if !Book.find_by(isbn:isbn)
    #         book.save
    #     end
    # end
end