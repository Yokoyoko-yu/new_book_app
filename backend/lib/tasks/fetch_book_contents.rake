namespace :award_book_contents do
    desc "APIからaward_titlesが入っている本のisbnを取得する"
    task fetch_book_data: :environment do
        puts "aaaa"
        AwardTitle.find_each do |award|
            puts "タイトル：#{award.title},著者:#{award.author}"
            puts (award.title)
            puts award.id
            award_book_contents=AwardBookContent.find_by(award_title_id:award.id)
            if !award_book_contents
                puts " → 新規取得対象。APIを呼び出します"
                FetchAwardBookData.search_info(award.id,award.title,award.author)
            else
                puts "登録済みのため、スキップします"
            end
        end
    end
end