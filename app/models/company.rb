class Company < ApplicationRecord


  mount_uploader :logo, LogoUploader

  belongs_to :user, optional: true
  has_many :branches

  has_many :category

end
