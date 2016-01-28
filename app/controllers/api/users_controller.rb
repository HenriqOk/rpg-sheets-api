class Api::UsersController < Api::BaseController

  def create
    respond_with User.create!(permitted_params)
  end

  def show
    respond_with User.find(params[:id])
  end

  def update
    adventure = User.find(params[:id])
    respond_with adventure.update!(permitted_params)
  end

  def destroy
    respond_with User.destroy!(params[:id])
  end

  private

  def permitted_params
    params.require(:user).permit(User.attribute_names.map(&:to_sym))
  end
end
