class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション

  # imageも空で投稿できないように追記
  validates :text, :image, presence: true

  def self.search(search)
    if search != ""
       search = "%#{search}%"
       Tweet.find_by_sql(["select * from tweets where text like ? ", search])
    else
      Tweet.all
    end
  end
end