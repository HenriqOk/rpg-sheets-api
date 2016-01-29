class Api::UsersController < Api::BaseController
  # respond_to :json

  def create
    @user = User.create!(permitted_params)
    respond_with :api, @user
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(permitted_params)
    respond_with :api, @user
  end

  def destroy
    User.find(params[:id]).destroy!(params[:id])
    render json: {}
  end

  private

  def permitted_params
    params.require(:user).permit(:name, adventure_ids: [])
  end
end
