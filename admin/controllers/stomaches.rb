Admin.controllers :stomaches do

  get :index do
    @stomaches = Stomach.all
    render 'stomaches/index'
  end

  get :new do
    @stomach = Stomach.new
    render 'stomaches/new'
  end

  post :create do
    @stomach = Stomach.new(params[:stomach])
    if @stomach.save
      flash[:notice] = 'Stomach was successfully created.'
      redirect url(:stomaches, :edit, :id => @stomach.id)
    else
      render 'stomaches/new'
    end
  end

  get :edit, :with => :id do
    @stomach = Stomach.find(params[:id])
    render 'stomaches/edit'
  end

  put :update, :with => :id do
    @stomach = Stomach.find(params[:id])
    if @stomach.update_attributes(params[:stomach])
      flash[:notice] = 'Stomach was successfully updated.'
      redirect url(:stomaches, :edit, :id => @stomach.id)
    else
      render 'stomaches/edit'
    end
  end

  delete :destroy, :with => :id do
    stomach = Stomach.find(params[:id])
    if stomach.destroy
      flash[:notice] = 'Stomach was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Stomach!'
    end
    redirect url(:stomaches, :index)
  end
end