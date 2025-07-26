require 'net/http'
require 'uri'
require 'json'
require 'nokogiri'


class OpensearchApi
    def initialize
        @ns={
        'dc' => 'http://purl.org/dc/elements/1.1/',
        'xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
        'dcndl' => 'http://ndl.go.jp/dcndl/terms/'
        }
    end
    #title,authorを入れて出てくるisbnをすべて返す。
    def self.fetch_all_isbn(title,author)
        isbn_array=[]
        @ns = {
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
            if xml_category=="図書"
                item.xpath('dc:identifier', @ns).each do |node|
                if node['xsi:type']=='dcndl:ISBN'
                    xml_isbn=node.text
                    xml_isbn=xml_isbn.to_s().gsub("-","")
                    isbn_array.push(xml_isbn)
                end                    
                end
            end
        end
        isbn_array
    end

    #著者とタイトルを渡すと、一致するタイトルのisbnを返す
    def self.match_title_isbn(title,author)
        isbn_list=[]
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

            if xml_category=="図書" && xml_title==title
                item.xpath('dc:identifier', ns).each do |node|
                    if node['xsi:type']=='dcndl:ISBN'
                        xml_isbn=node.text
                        xml_isbn=xml_isbn.to_s().gsub("-","")
                        isbn_list.push(xml_isbn)
                    end
                end
            end
            return isbn_list
        end
    end

#isbnとタイトルを渡して一致するか返す
    def self.judge_isbn(isbn,title)
        uri=URI("https://ndlsearch.ndl.go.jp/api/opensearch?isbn=#{isbn}")
        res = Net::HTTP.get(uri)
        xml = Nokogiri::XML(res)
        item = xml.xpath('//item')[0]
        xml_title = item.at('title')&.text if item
        xml_title == title
    end
end