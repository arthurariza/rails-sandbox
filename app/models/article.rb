class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy, class_name: 'Comment'

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
