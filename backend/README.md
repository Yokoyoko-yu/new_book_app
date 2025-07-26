# README

蔵書アプリ
<br>
ログイン機能
<br>
蔵書の状態を確認する機能
<br>
文学賞ごとに所持している本と読了している本を確認する機能


<br>

## バッチ処理
rake lib/tasks/fetch_book_contentsを実行するとバッチ処理を行うことができる。

### バッチ処理の内容
- AwardTitlesテーブルからタイトルと著者を取り出し、opensearchAPIで検索
- isbnを取り出し、openBDで検索
- 得られた書籍情報をbooksテーブルに保存
- openBDで本に収録されているタイトルを入手し、award_titlesにあればaward_book_contentsに保存

