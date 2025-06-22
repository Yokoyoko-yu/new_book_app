# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
##これはwsl2上ファイルです
require 'csv'

LiteraryAward.create!(id:1,name:'芥川賞',total:171)
LiteraryAward.create!(id:2,name:'三島由紀夫賞',total:37)
LiteraryAward.create!(id:3,name:'野間文芸新人賞',total:46)

csv_file_path = Rails.root.join('db/akutagawa.csv')

CSV.foreach(csv_file_path, headers: true) do |row|
    # 各行のデータを取得し、データベースに保存
    AwardBook.create!(
    times: row['回'],
    title: row['タイトル'],
    author: row['著者'],
    literary_award_id:1
    )
  end

mishima=Rails.root.join('db/mishima.csv')

CSV.foreach(mishima,headers: true) do |award|
    AwardBook.create!(
        times: award['回数'],
        title: award['タイトル'],
        author: award['著者'],
        literary_award_id:2
    )
end
noma=Rails.root.join('db/noma.csv')

CSV.foreach(noma,headers: false) do |line|
    # line=line.split(',')
    AwardBook.create!(
        times:line[0],
        title:line[1],
        author:line[2],
        literary_award_id:3
    )
end
