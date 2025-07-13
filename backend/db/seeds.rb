# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
##これはwsl2上ファイルです
require 'csv'

Award.create!(id:1,name:'芥川賞',total:172)
Award.create!(id:2,name:'三島由紀夫賞',total:37)
Award.create!(id:3,name:'野間文芸新人賞',total:46)

csv_file_path = Rails.root.join('db/akutagawa.csv')

CSV.foreach(csv_file_path, headers: true) do |row|
    award_title=AwardTitle.create!(
        title:row['タイトル'],
        author:row['著者']
    )
    AwardGrant.create!(
        award_id:1,
        award_title_id:award_title.id,
        times:row['回']
    )
    end



mishima=Rails.root.join('db/mishima.csv')

CSV.foreach(mishima,headers: true) do |row|
    award_title=AwardTitle.create!(
    title:row['タイトル'],
    author:row['著者']
    )
    AwardGrant.create!(
    award_id:2,
    award_title_id:award_title.id,
    times:row['回数']
    )
    end


noma=Rails.root.join('db/noma.csv')
CSV.foreach(noma,headers: false) do |row|
    award_title=AwardTitle.create!(
    title:row[1],
    author:row[2]
    )
    AwardGrant.create!(
    award_id:3,
    award_title_id:award_title.id,
    times:row[0]
    )
    end
 

# end
