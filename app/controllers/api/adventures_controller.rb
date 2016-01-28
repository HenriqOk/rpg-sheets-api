class Api::AdventuresController < Api::BaseController

  def create
    respond_with Adventure.create!(permitted_params)
  end

  def show
    respond_with Adventure.find(params[:id])
  end

  def update
    adventure = Adventure.find(params[:id])
    respond_with adventure.update!(permitted_params)
  end

  def destroy
    respond_with Adventure.destroy!(params[:id])
  end

  private

  def permitted_params
    params.require(:adventure).permit(Adventure.attribute_names.map(&:to_sym))
  end

end
