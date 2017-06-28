class KittensController < ApplicationController

 def index
    @kittens = Kitten.all 

    #JSON reqest for API
    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  def new
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end

  def new 
  	@kitten = Kitten.new
  end

  def create 
  	@kitten = Kitten.new(kitten_params)
  	if @kitten.save 
  		flash[:success] = "Kitten Saved!"
      redirect_to @kitten
  	else 
  		render 'new'
  	end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Kitten updated"
      redirect_to @kitten
    else
      render 'edit'
    end
  end

  def destroy
    Kitten.find(params[:id]).destroy
    flash[:success] = "Kitten deleted"
    redirect_to kittens_url
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :cuteness, :softness,
                                 :age)
  end
end
