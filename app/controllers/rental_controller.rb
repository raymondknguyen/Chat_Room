class RentalController<ApplicationController

  def new
    @item = GearItem.find(params[:item_id])
  end

  def create
    item = GearItem.find(rental_params[:item_id])
    rental = Rental.new(start_date: rental_params[:start_date],
                   end_date: rental_params[:end_date],
                   user_id: current_user.id,
                   gear_item_id: item.id)
    if rental.save
      flash[:success] = "You've successfully submitted a rental request!"
      redirect_to ("/profile")
    else
      flash[:error] = "Something went wrong -- try your request again"
      redirect_to ("/rental/#{item.id}")
    end
  end

  private

  def rental_params
    params.permit(:item_id, :start_date, :end_date)
  end

end
