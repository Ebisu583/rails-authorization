class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all # If users can see all restaurants
      scope.where(user: user) # If users can only see their restaurants
      # scope.where("name LIKE 't%'") # If users can only see restaurants starting with `t`
      # ...
    end
  end
    def show?
      true
    end

    def new?
      return create?
    end

    def create?
      true
    end

    def edit?
      return update?
    end

    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end
end
