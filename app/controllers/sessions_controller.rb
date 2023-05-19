class SessionsController < UserController
  before_action :redirect_if_authenticated, only: [:create, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if @user.authenticate(params[:user][:password])
        login @user
        redirect_to root_path, notice: 'Signed in.'
      else
        flash.now[:alert] = 'Incorrect password.'
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = 'Incorrect email'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Signed out.'
  end
end
