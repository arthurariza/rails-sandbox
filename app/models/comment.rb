class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  validates :commenter, presence: true
  validates :body, presence: true

  after_create_commit -> { broadcast_append_later_to article }
  after_update_commit -> { broadcast_replace_later_to article }
  after_destroy_commit -> { broadcast_remove_to article }
end
