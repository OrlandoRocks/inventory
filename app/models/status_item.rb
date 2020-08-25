class StatusItem < ApplicationRecord
  has_many :items
  before_destroy :check_for_items

  private
  def check_for_items
    if items.count > 0
      #errors.add_to_base('No es posible eliminar el estatus ya que existen artículos con este estatus.')
      flash[:notice] = 'No es posible eliminar el estatus ya que existen artículos con este estatus.'
      render 'status_items_path'

      return false
    end
  end

end
