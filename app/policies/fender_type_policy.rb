#TODO: Cuando se creen los etatus quietar los artículos que esten en baja para los perfiles Director, Gerente y Coordinador

class FenderTypePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end