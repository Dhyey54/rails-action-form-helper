class RegistrationsController < UsersController
  before_action :redirect_if_authenticated, only: [:create, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_now
      redirect_to root_path, notice: "Successfully created account"
    else
      render :new, status: :unprocessable_entity
    end
  end
end
