# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# suhuri DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many :messages
- has_many :comments

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|image|string|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|user_id|references|null: false, foreign_key: true|
|message_id|references|null: false, foreign_key: true|
### Association
- belongs_to :message
- belongs_to :user

