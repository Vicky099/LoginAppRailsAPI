class Api::V1::AuthenticationsController < Api::V1::BaseController
	before_action :authorize_request, except: :login

	def login
		@user = User.find_by_email(params[:user][:email])
		if @user && @user.authenticate(params[:user][:password])
			token = JsonWebToken.encode(user_id: @user.id)
			time = Time.now + 24.hours.to_i
			render json: {status: 'success', code: 200, message: ['Login successful'], data: [token: token, exp: time.strftime("%m-%d-%Y %H:%M"), username: @user.username ]}, status: :ok
		else
			render json: { status: 'error', code: 401, message: ['Unauthorized access'], data: []}, status: :unauthorized
		end
	end

	private
	def login_params
		params.require(:user).permit(:email, :password)
	end
end
