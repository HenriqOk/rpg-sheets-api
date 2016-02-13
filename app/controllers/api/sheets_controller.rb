class Api::SheetsController < Api::BaseController

  def create
    adventure = Adventure.find(params[:adventure_id])
    @new_sheet = Sheet.new(permitted_params)

    adventure.sheets << @new_sheet
    adventure.save!

    respond_with(:api, adventure, @new_sheet)
  end

  def show
    respond_with Adventure.find(params[:adventure_id]).sheets.find(params[:id])
  end

  def update
    adventure = Adventure.find(params[:adventure_id])

    respond_with adventure.update!(permitted_params)
  end

  def destroy
    respond_with Sheet.destroy!(params[:id])
  end

  private

  def permitted_params
    params.require(:sheet).permit(:name, :level, :attack_bonus, :armor_class, :hp, :mp, :state, :adventure_id, :player_id)
  end
end
