class AddressesController < ApplicationController

  def show
    @user = User.find(params[:id])
    @addresses = @user.addresses
  end

end
