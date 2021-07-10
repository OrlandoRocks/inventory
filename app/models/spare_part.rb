class SparePart < ApplicationRecord
  belongs_to :sub_category
  has_one :category, through: :sub_category


  validate :unique_sub_category_for_spare_parts

  private

  def unique_sub_category_for_spare_parts

    spare_part = SparePart.where(sub_category_id: self.sub_category_id)

    if spare_part.count > 1
      errors.add("Sub Categoria:", 'No pueden exisitir Refacciones Iguales')
    end
  end

end
