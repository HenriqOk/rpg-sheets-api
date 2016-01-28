class Api::SheetsController < Api::BaseController

  def create
    respond_with Sheet.create!(permitted_params)
  end

  def show
    respond_with Sheet.find(params[:id])
  end

  def update
    adventure = Sheet.find(params[:id])
    respond_with adventure.update!(permitted_params)
  end

  def destroy
    respond_with Sheet.destroy!(params[:id])
  end

  private

  def permitted_params
    params.require(:sheet).permit(Sheet.attribute_names.map(&:to_sym))
  end
end
