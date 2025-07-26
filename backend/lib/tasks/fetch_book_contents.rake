namespace :award_book_contents do
    desc "APIからaward_titlesが入っている本のisbnを取得してaward_book_contentsに収録"
    task fetch_book_data: :environment do
        AwardTitle.find_each do |award_title|
            puts "タイトル：#{award_title.title},著者:#{award_title.author}"
            puts (award_title.title)
            puts award_title.id

            isbn_array=OpensearchApi.fetch_all_isbn(award_title.title,award_title.author)
            isbn_array.each do |isbn|
                openbd_info=OpenbdApi.search_titles(isbn)
                puts openbd_info
                if !(openbd_info.nil?) && !(openbd_info[:titles].nil?)
                    #titleがあればbooksに追加し、award_book_contentsに登録
                    openbd_info[:titles].each do |title| 
                        if title==award_title.title
                            book_data=FetchBookData.fetch(isbn)
                            Book.find_or_create_by(book_data)
                            AwardBookContent.find_or_create_by(isbn:openbd_info[:isbn],award_title_id:award_title.id)
                            puts "isbn:#{openbd_info[:isbn]}を追加"
                        end
                    end
                else
                    isbn13=openbd_info[:isbn]
                    #openbdでタイトルが得られない場合、opensearchから情報を得る
                    isbn_from_title_list=OpensearchApi.judge_isbn(isbn13,award_title.title)
                    if isbn_from_title_list
                        book_data=FetchBookData.fetch(isbn)
                        Book.find_or_create_by(book_data)
                        AwardBookContent.find_or_create_by(isbn:isbn13,award_title_id:award_title.id)
                    end
                end
            end

        end
    end
end