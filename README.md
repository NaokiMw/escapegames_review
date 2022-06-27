<h1>謎レビュ</h1>

<h3>コンセプト</h3>
<h4>
  ネタバレの心配不要の謎解きレビュー共有サイト（ゲストログイン機能あり）<br>
  https://nazoreview.herokuapp.com/
</h4>
<h3>作成した理由</h3>
<h4>
  どんな脱出ゲームも人生で１回しかネタバレなしに楽しむことができません。<br>
  ですが、SNSやインターネットで名前を検索してうっかりネタバレを見てしまうことも...。<br>
  脱出ゲームの感想を未プレイの人に見せたくない方のためにも、<br>
  公開・非公開機能のついた日記も用意しています。<br>
  謎レビュは脱出ゲームのネタバレ防止に配慮したレビュー型SNSです。<br>
</h4>
<br>
<h3>DEMO</h3>
<h4>レビュー</h4>
<img width="1390" alt="review sample" src="https://user-images.githubusercontent.com/97737542/175895636-f991e6d7-6639-4f59-a534-e8075512b056.png">
<h4>日記</h4>
<img width="1418" alt="diary" src="https://user-images.githubusercontent.com/97737542/175895913-ad5ae1de-cc19-4df7-b601-09c17f9fedc8.png">
<br>
<h3>ER図</h3>
<img alt="ER" src="https://user-images.githubusercontent.com/97737542/175894524-784436e4-6182-4824-8320-421146c67c47.png">
<br>
<h3>機能一覧</h3>
<br>

| 機能名 | 内容 |
 ------------- | ------------- 
| 1.ログイン | gemのdeviseを用いており、ゲストログイン機能とSNS認証をつけています。<br>マイページから、プロフィールやユーザーネーム等を編集できます。 |
| 2.レビュー | raty.jsを用いて、星評価で総合評価をつけることができます。画像はS3に保存されています。<br>自身が作成したレビューは削除ボタン、他者のレビューには、興味ありとフォローのボタンが表示されています。 <br>１０件ごとにページ送りを設定しています。|
| 3.マップ | レビューに記載された施設の場所をGoogleマップで確認することができます。<br>住所を正確に入れなくても、施設名から緯度と軽度を取得します。  |  
| 4.タグ | レビューにタグをつけることができます。<br>レビューについたタグを検索すると、そのタグを持った持ったレビューが表示されます。 |
| 5.検索 | タイトル、住所、各レビュー項目とタグ名でレビューを検索することができます。 |
| 6.興味あり | 興味ありボタンを押したレビューは、マイページから参照することができます。<br>興味を持って体験した後に興味なしボタンを押すと、興味のあるレビューの一覧から削除されます。 |
| 7.フォロー | フォローしているユーザーとフォローされているユーザーはマイページのリンクから移動したページで確認できます。<br>フォローバックしたり、フォローを外すこともそのページから可能です。 |
| 8.マイページ | マイページには興味ありとフォローとフォローされているユーザーを確認できるリンクがあります。<br>また、プロフィールを編集できるページへのリンクもあり、編集したプロフィールはマイページに表示されます。<br>自身のレビューと日記の一覧、フォローしたユーザーのレビューと日記の一覧の最新１０件が表示されます。 |
| 9.日記 | 日記は公開と非公開を選択して作成します。<br>日記には画像を任意で添付することができます。フォローされているユーザーにのみ日記は公開されます。<br>未ログイン、未フォローのユーザーは公開中の日記を閲覧することができません。<br>日記の一覧には非公開・公開中の自身の日記と、フォローしているユーザーの公開中の日記が表示されます。 |
<br>
<h3>こだわりポイント</h3>
<h4>
  1.bootstrap5の公式ドキュメントを読みながら、レスポンスデザインにしました。<br>
  2.探偵をテーマにした背景素材と、レンガ調のヘッダーとフッターで統一感を持たせました。<br>
  3.ネタバレ防止の為に、レビューの新規作成は選択形式、日記は一覧のタイトルを確認して自衛できるようにしました。<br>
  4.リアル脱出ゲームの概要と、Googleのログイン認証をつけて、ユーザーの利用までの敷居を下げました。<br>
  5.レビューを見て行ける距離と場所なのかすぐに確認できるように、Googleマップで場所が表示されるようにしました。
</h4>
<br>
<h4>作成者: 前川直輝</h4>
