# == Schema Information
#
# Table name: users_work_articles
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  work_article_id  :integer
#  reception_status :integer
#  delivery_status  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class UsersWorkArticle < ActiveRecord::Base
  belongs_to :user
  belongs_to :work_article

  enum reception_status: [:good, :not_very_good, :bad]
  enum delivery_status: [:ds_good, :ds_not_very_good, :ds_bad]

  delegate :name, to: :work_article, prefix: true
end
