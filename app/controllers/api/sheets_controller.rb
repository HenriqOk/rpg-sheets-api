class Api::SheetsController < Api::BaseController

  def create
    adventure = Adventure.find(params[:adventure_id])
    @new_sheet = Sheet.new(permitted_params)

    adventure.sheets << @new_sheet
    adventure.save!

    respond_with :api, adventure, @new_sheet
  end

  def show
    adventure = Adventure.find(params[:adventure_id])
    render json: adventure.sheets.find(params[:id])
  end

  def update
    adventure = Adventure.find(params[:adventure_id])
    sheet = adventure.sheets.find(params[:id])
    sheet.update!(permitted_params)
    respond_with :api, adventure, sheet
  end

  def destroy
    Adventure.find(params[:adventure_id]).sheets.find(params[:id]).destroy!
    render nothing: true, status: 204
  end

  private

  def permitted_params
    params.require(:sheet).permit(:name, :level, :attack_bonus, :armor_class, :hp, :mp, :state, :adventure_id, :player_id)
  end
end
