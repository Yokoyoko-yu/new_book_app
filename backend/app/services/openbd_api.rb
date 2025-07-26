require 'net/http'
require 'uri'
require 'json'
require 'nokogiri'

class OpenbdApi
    #ISBNの値で検索しbooksテーブルに登録する.また、受賞タイトルが収録されていたらaward_book_contentsに登録する。
    def register_book_and_award_if_exists(isbn)

    end
    #isbnで検索し、その本に収録されているタイトルを配列で返す
    def self.search_titles(isbn)
        uri = URI("https://api.openbd.jp/v1/get?isbn=#{isbn}")
        res = Net::HTTP.get(uri)
        json = JSON.parse(res)
        if !(json[0].nil?) && !(json[0]["onix"]["CollateralDetail"]["TextContent"].nil?)
            book_info=json[0]["summary"]
            puts json[0]["onix"]["CollateralDetail"]["TextContent"]
            titles=json[0]["onix"]["CollateralDetail"]["TextContent"][0]["Text"].split
            puts titles
            isbn=book_info["isbn"]
        end
        # puts {titles:titles,isbn:isbn}
        {titles:titles,isbn:isbn}
    end
end