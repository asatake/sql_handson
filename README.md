# SQL 練習 handson

## 概要

[SQLZOO](https://sqlzoo.net/wiki/SQL_Tutorial/ja)だと Insert の練習とかができないので、  
このレポジトリで好きなだけ更新系の練習とかお遊びを好きなだけできるようにした

## 起動方法

1. この レポジトリを git clone する
1. `docker-compose up -d` で起動
1. ちょっとだけ待つ
  - `docker-compose logs -f app` とかでログが落ち着くのを待つのが良い
1. `localhost:8080/` にアクセス

## 練習方法

1. `docker-compose exec db psql -U postgres -d blog_dev`
1. あとは SQL を叩くだけ!

## DB の構造(ざっくり)
-   articles  
    
    | column name  | type     | supplement          |
    |--------------|----------|---------------------|
    | id           | integer  |                     |
    | title        | string   | 記事のタイトル      |
    | body         | string   | 内容                |
    | author       | integer  | 筆者 user.id が入る |
    | inserted\_at | datetime | 作成日時            |
    | updated\_at  | datetime | 更新日時            |

-   users  
    
    | column name  | type     | supplement |
    |--------------|----------|------------|
    | id           | integer  |            |
    | name         | string   | ユーザ名   |
    | inserted\_at | datetime | 作成日時   |
    | updated\_at  | datetime | 更新日時   |
