class Client < ApplicationRecord

  has_associated_audits

  audited


  def full_name
    "#{self.name} #{self.last_name} #{self.maiden_name}"
  end
end
