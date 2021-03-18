class Brand < ApplicationRecord

  has_many :trailer_category
  has_many :items

  accepts_nested_attributes_for :trailer_category

  before_destroy :check_for_items
  private
  def check_for_items
    if items.count > 0
      flash[:notice] = 'No es posible eliminar el estatus ya que existen artículos con este estatus.'
      render 'brands_path'
      return false
    end
  end
end
