# namespace :award_book_contents do
#     desc "APIからaward_titlesが入っている本のisbnを取得する"
#     task fetch_book_data: :environment do
#         #opensearchAPIからタイトルと著者で検索し、図書のisbnを入手する
#         AwardTitle.find_each do |award_title|
#         isbn_array=OpensearchApi.fetch_isbn(title,author)
#         #openBDからISBNの値で検索し、タイトル群、著者、出版社情報を入手,Booksテーブルに登録
#         isbn_array.each do |isbn|
#             OpenbdApi.register_book_and_award_if_exists(isbn)
#         end
#         end
#     end
# end