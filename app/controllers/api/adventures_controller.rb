class Api::AdventuresController < Api::BaseController

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
    params.require(:adventure).permit(Adventure.attribute_names.map(&:to_sym))
  end

end
