# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

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
# with open('noma.csv','r',encoding='utf-8')as file
#     for line in file:
#         line=line.strip()
#         line=line.split(',')
#         AwardBook.create!(
#             times:line[0],
#             titile:line[1]
#             author:line[2]
#             literary_award_id:1
#         )
#     end
# AwardBook.create!({
#     times:168,      
#     title:'荒地の家族',
#     author:'佐藤厚志',
#     literary_award_id:1
# })

# AwardBook.create!({
#     times:168,
#     title:'この世の喜びよ',
#     author:'井戸川射子',
#     literary_award_id:1
# })

# AwardBook.create!({
#     times:167,
#     title:'おいしいごはんが食べられますように',
#     author:'高瀬隼子',
#     literary_award_id:1
# })

# AwardBook.create!({
#     times:166,
#     title:'ブラックボックス',
#     author:'砂川文次',
#     literary_award_id:1
# })

# AwardBook.create!({
#     times:165,
#     title:'貝に続く場所にて',
#     author:'石沢麻衣',
#     literary_award_id:1
# })

# AwardBook.create!({
#     times:165,
#     title:'彼岸花が咲く島',
#     author:'李琴峰',
#     literary_award_id:1
# })

# AwardBook.create!({
#     times:164,
#     title:'推し燃ゆ',
#     author:'宇佐見りん',
#     literary_award_id:1
# })

# AwardBook.create!({
#     times:163,
#     title:'破局',
#     author:'遠野遥',
#     literary_award_id:1
# })

# AwardBook.create!({
#     times:163,
#     title:'首里の馬',
#     author:'高山羽根子',
#     literary_award_id:1
# })



