#TODO: Cuando se creen los etatus quietar los artículos que esten en baja para los perfiles Director, Gerente y Coordinador

class ClientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @clients = scope.all
    end
  end
end