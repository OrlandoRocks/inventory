class WorkArticle < ActiveRecord::Base

  has_many :users_work_articles
  has_many :users, through: :users_work_articles

  validates :name, presence: true

  def self.not_assigned_to_user(user)
    if user.users_work_articles.where('delivery_status IS NULL').size == 0
      all
    elsif user.users_work_articles.size > 0
      where(
          'id not in (?)',
          UsersWorkArticle.where('user_id = ? and delivery_status IS NULL', user.id).pluck(:work_article_id),
      )
    else
      all
    end
  end

end
