class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def uniq_comment_users
    if !self.comments.empty?
      self.comments.collect do |comment|
        comment.user
      end
    end
  end

end
