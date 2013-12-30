class InquiriesController < ApplicationController

  def index
    @inquiries = Inquiry.all
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
  @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      flash.now[:alert]= 'Thank you for your message!'
      redirect_to inquiries_path
    else
      flash.now[:alert]= 'Error while sending message!'
      render :new
    end
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    @inquiry.update_attributes!(inquiry_params)
    redirect_to inquiries_path
  end

  def destroy
    @inquiry = Inquiry.find_by_id(params[:id])
      if @inquiry.destroy
        redirect_to inquiries_path
      end
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:first_name, :last_name, :email, :subject, :description)
  end
end
