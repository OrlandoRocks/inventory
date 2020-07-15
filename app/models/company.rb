class Company < ActiveRecord::Base


  mount_uploader :logo, LogoUploader

  belongs_to :user
  has_many :branches

  has_many :category

end
