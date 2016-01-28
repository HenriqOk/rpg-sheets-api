class Api::UsersController < Api::BaseController

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def permitted_params
    params.require(:user).permit(User.attribute_names.map(&:to_sym))
  end
end
