# == Schema Information
#
# Table name: trailer_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  image      :string
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  model_part :string
#

class TrailerType < ApplicationRecord

  has_many :trilers
  has_many :trailer_category

  accepts_nested_attributes_for :trailer_category
  has_one_attached :image
  
  def self.get_categories(trailer_id)
    @categories = Hash.new
    if trailer_id
      self.find(trailer_id).trailer_category.each do | category |
        case (category['key']) 
          when 'trailer_length_id'
            @categories['trailer_length'] ||= Array.new
            @categories['trailer_length'] << TrailerLength.find(category['trailer_length_id'])
          when 'ramp_type_id'
            @categories['ramp_type'] ||= Array.new
            @categories['ramp_type'] << RampType.find(category['ramp_type_id'])
          when 'redila_type_id'
            @categories['redila_type'] ||= Array.new
            @categories['redila_type'] << RedilaType.find(category['redila_type_id'])
          when 'floor_type_id'
            @categories['floor_type'] ||= Array.new
            @categories['floor_type'] << FloorType.find(category['floor_type_id'])
          when 'capacity_id'
            @categories['capacity'] ||= Array.new
            @categories['capacity'] << Capacity.find(category['capacity_id'])
          when 'trailer_width_id'
            @categories['trailer_width'] ||= Array.new
            @categories['trailer_width'] << TrailerWidth.find(category['trailer_width_id'])
          when 'color_id'
            @categories['color'] ||= Array.new
            @categories['color'] << Color.find(category['color_id'])
          when 'hydraulic_jack_id'
            @categories['hydraulic_jack'] ||= Array.new
            @categories['hydraulic_jack'] << HydraulicJack.find(category['hydraulic_jack_id'])
          when 'pull_type_id'
            @categories['pull_type'] ||= Array.new
            @categories['pull_type'] << PullType.find(category['pull_type_id'])
          when 'brake_type_id'
            @categories['brake_type'] ||= Array.new
            @categories['brake_type'] << BrakeType.find(category['brake_type_id'])
          when 'brand_id'
            @categories['brand'] ||= Array.new
            @categories['brand'] << Brand.find(category['brand_id'])
          when 'fender_type_id'
            @categories['fender_type'] ||= Array.new
            @categories['fender_type'] << FenderType.find(category['fender_type_id'])
          when 'turn_type_id'
            @categories['turn_type'] ||= Array.new
            @categories['turn_type'] << TurnType.find(category['turn_type_id'])
          when 'divition_type_id'
            @categories['divition_type'] ||= Array.new
            @categories['divition_type'] << DivitionType.find(category['divition_type_id'])
          when 'suspension_type_id'
            @categories['suspension_type'] ||= Array.new
            @categories['suspension_type'] << SuspensionType.find(category['suspension_type_id'])
          when 'roof_type_id'
            @categories['roof_type'] ||= Array.new
            @categories['roof_type'] << RoofType.find(category['roof_type_id'])
          else
            nil
        end        
      end       
      @categories
    end  

  end


end
