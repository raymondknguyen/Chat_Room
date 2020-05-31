class RentalController<ApplicationController

  def new
    @item = GearItem.find(params[:item_id])
  end

  def create
    rental = Rental.new(start_date: params[:start_date],
                   end_date: params[:end_date],
                   user_id: current_user.id,
                   gear_item_id: params[:item_id])
    if rental.save
      flash[:success] = "You've successfully submitted a rental request!"
      redirect_to ("/profile")
    else
      flash[:error] = "Something went wrong -- try your request again"
      redirect_to ("/rental/#{@snowboard.id}")
    end
  end

end
