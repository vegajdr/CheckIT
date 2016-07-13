class PostPolicy < ApplicationPolicy

  def edit?
    true
  end

  def destroy?
    true
  end

end
