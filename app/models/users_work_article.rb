class UsersWorkArticle < ActiveRecord::Base
  belongs_to :user
  belongs_to :work_article

  enum reception_status: [:good, :not_very_good, :bad]
  enum delivery_status: [:ds_good, :ds_not_very_good, :ds_bad]

  delegate :name, to: :work_article, prefix: true
end
