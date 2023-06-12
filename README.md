<div align="center">
    <h1>social_doge</h1>
    <img width="40%" src="docs/icons/doge.png">
    <p>Social Dog 代替(予定)</p>
</div>

[ja](.) / [en](.)

## What is this?

Social Dog の代替を目的として開発されました。

> SocialDogは、運用、効率化、自動化、分析、アカウント管理などTwitterマーケティングに必要な機能を網羅しています。
> 「エンゲージメントを高めたい」「効率化・自動化したい」など、Twitterマーケティングにおけるあらゆる課題を解決するツールです。
> [social-dog.net](https://social-dog.net/ja/)

2023年5月にTwitter API有料化に伴いSocial Dogの主要な機能の全てが有料化しました

- [Twitter API有料化に伴うLiteプラン（無料プラン）の機能制限のお知らせ](https://social-dog.net/ja/help/other/notice/lite_plan_features_reduction/)
- [Twitter Dev](https://twitter.com/TwitterDev/status/1623467615539859456)

## What does app do?

Twitterをリバースエンジニアリングし、無料でTwitterのAPIにアクセスします。

- [ ] フォロー管理
  - [ ] 差分管理
  - [ ] 一覧管理
- [ ] フォロワー管理
  - [x] 差分管理
  - [ ] 一覧管理
- [ ] 複数アカウント
- [ ] 複数ログイン
- [ ] 多言語
  - [ ] 英語
  - [ ] 日本語
- [x] テーマ
  - [x] ダーク
  - [x] ハイコントラスト

## Twitter's Terms of Service

私は司法の専門家ではないので詳しいことはわかりませんが、このアプリがTwitterの利用規約に抵触している可能性があります。
アカウントが凍結する可能性が否定できないためサブアカウントでログインすることを推奨しています。
管理するアカウントとログインするアカウントは分けることが出来ます。

## How to use

- `Synchronize` をタッチして同期を開始します。1回のリクエストで100人前後のユーザーが取得でき15分間で50回リクエストを行うことが出来ます。よってフォロワーが5000人を超える場合はリミットに到達しやすく同期に時間がかかる場合があります。
- `Unfollowed` タブは日付ごとにフォロワーを解除したユーザーを表示します。差分表示には同期2回分のデータが必要です。

## Interested in reverse engineering?

- [fa0311/twitter-openapi](https://github.com/fa0311/twitter_openapi_dart)
- [fa0311/twitter_openapi_dart](https://github.com/fa0311/twitter_openapi_dart)
