class Api::AdventuresController < Api::BaseController

  def create
    @adventure = Adventure.create!(permitted_params)
    respond_with :api, @adventure
  end

  def show
    render json: Adventure.find(params[:id])
  end

  def update
    @adventure = Adventure.find(params[:id])
    @adventure.update!(permitted_params)
    respond_with :api, @adventure
  end

  def destroy
    Adventure.find(params[:id]).destroy!(params[:id])
    render nothing: true, status: 204
  end

  private

  def permitted_params
    params.require(:adventure).permit(:name, :master_id, player_ids: [])
  end

end
