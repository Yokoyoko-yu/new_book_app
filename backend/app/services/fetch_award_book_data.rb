require 'net/http'
require 'uri'
require 'json'
require 'nokogiri'

class FetchAwardBookData
    #賞のidを入力すれば受賞作の一覧を表示する関数
    def self.fetch(id)
        award_books=AwardTitle.find_by_sql(<<-SQL)
        Select award_titles.title,award_titles.author,award_grants.times 
        from award_titles 
        inner join award_grants on award_titles.id=award_grants.award_title_id
        where award_grants.award_id=#{id}
        order by award_grants.times asc

        SQL
        award_books
        
    end

    #書籍のタイトル、著者情報から収録されている本を登録
    def self.register_award_book_contents(id,title,author)
        #opensearchで検索するための処理
        ns = {
        'dc' => 'http://purl.org/dc/elements/1.1/',
        'xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
        'dcndl' => 'http://ndl.go.jp/dcndl/terms/'
        }
        search_title=URI.encode_www_form_component(title)
        search_author=URI.encode_www_form_component(author)
        uri=URI("https://ndlsearch.ndl.go.jp/api/opensearch?creator=#{search_author}&title=#{search_title}")
        res = Net::HTTP.get(uri)
        xml = Nokogiri::XML(res)


    end


    #書籍のタイトル,著者を渡せば収録されている本を登録
    def self.search_info(id,title,author)
        ns = {
        'dc' => 'http://purl.org/dc/elements/1.1/',
        'xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
        'dcndl' => 'http://ndl.go.jp/dcndl/terms/'
        }
        search_title=URI.encode_www_form_component(title)
        search_author=URI.encode_www_form_component(author)
        uri=URI("https://ndlsearch.ndl.go.jp/api/opensearch?creator=#{search_author}&title=#{search_title}")
        res = Net::HTTP.get(uri)
        xml = Nokogiri::XML(res)

        items = xml.xpath('//item')

        items.each do |item|
            xml_category=item.at('category')&.text
            xml_title = item.at('title')&.text
            xml_creator = item.at('author')&.text
            #isbnをリセット
            xml_isbn=nil
            item.xpath('dc:identifier', ns).each do |node|
                # puts "ISBN候補: #{node.text}, xsi:type: #{node['xsi:type']}"
                if node['xsi:type']=='dcndl:ISBN'
                    xml_isbn=node.text
                    xml_isbn=xml_isbn.to_s().gsub("-","")
                end
            end

            if xml_category=="図書"&&xml_isbn
                
            end



        # アイテム一覧を取得（最大10件）
        items = xml.xpath('//item')
        xml_isbn=nil
        items.each do |item|
            xml_category=item.at('category')&.text
            xml_title = item.at('title')&.text
            xml_creator = item.at('author')&.text
            item.xpath('dc:identifier', ns).each do |node|
                # puts "ISBN候補: #{node.text}, xsi:type: #{node['xsi:type']}"
                if node['xsi:type']=='dcndl:ISBN'
                    xml_isbn=node.text
                    xml_isbn=xml_isbn.to_s().gsub("-","")
                end
            end



            if xml_category=="図書" && xml_title==title && xml_isbn
                # puts "成功！！"
                # puts "id:#{id}"
                # puts "タイトル: #{xml_title}"
                # puts "著者: #{xml_creator}"
                # puts "ISBN: #{xml_isbn}"
                # puts "---"
                book_info=FetchBookData.fetch(xml_isbn)
                if !(book_info.nil?)
                    book=Book.find_or_create_by(isbn:book_info[:isbn],author:book_info[:author],title:book_info[:title],publisher:book_info[:publisher])
                    record = AwardBookContent.find_or_initialize_by(isbn: book_info[:isbn], award_title_id: id)
                    if record.new_record?
                        if record.save
                        # puts "AwardBookContent 保存成功！"
                        else
                        # puts "保存失敗: #{record.errors.full_messages}"
                        puts "保存失敗ーーー"
                        end
                    else
                        # puts "既に存在しているため保存しませんでした"
                    end
                else
                    puts "書籍データを取得できませんでした。"
                end
            end
        end
    end

end