# README
Instagram copy-site

* Ruby version
  Ruby 2.3.1

* Rails version
  Rails 5.0.7

* DataBase Design
---

## Bookmark
### table
|Column|Type|Options|
|-|-|-|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|

### association
- belongs_to :post
- belongs_to :user

---
## Comment
### table
|Column|Type|Options|
|-|-|-|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
|content|string|null: false|
### association
- belongs_to :post
- belongs_to :user

---
## Like
### table
|Column|Type|Options|
|-|-|-|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### association
- belongs_to :post
- belongs_to :user

---
## Photo
### table
|Column|Type|Options|
|-|-|-|
|image|string|null: false|
|post_id|integer|null: false, foreign_key: true|
### association
- belongs_to :post

---
## Post
### table
|Column|Type|Options|
|-|-|-|
|name|string|null: false|
### association
- has_many :bookmarks
- has_many :comments
- has_many :likes
- has_many :photos
- belongs_to :user

---
## User
### table
|Column|Type|Options|
|-|-|-|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### association
- has_many :bookmarks
- has_many :comments
- has_many :likes
- has_many :posts
