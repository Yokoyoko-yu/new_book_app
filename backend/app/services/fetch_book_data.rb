class FetchBookData
    #書籍情報を取得する
    def self.fetch(isbn)
        isbn=isbn.gsub("-","")
        uri = URI("https://api.openbd.jp/v1/get?isbn=#{isbn}")
        res = Net::HTTP.get(uri)
        json = JSON.parse(res)
        puts json
        if !(json[0].nil?)
            book_info=json[0]["summary"]
            author=book_info["author"]
            title=book_info["title"]
            publisher=book_info["publisher"]
            if isbn.to_s.gsub("-","").length!=13
                isbn=book_info["isbn"]
            end

            {
                isbn:isbn,
                author:author,
                title:title,
                publisher:publisher
            }
        else
            return nil
        end
    end


end