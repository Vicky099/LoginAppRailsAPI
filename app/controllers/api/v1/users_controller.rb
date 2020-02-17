class Api::V1::UsersController < Api::V1::BaseController
	before_action :authorize_request, except: :create
	before_action :find_user, except: [:create, :index]

	def index
		@users = User.all
		render json: {status: 'success', code: 200, message: ['User details'], data: [@users]}, status: :ok
	end

	def show
		render json:{status: 'success', code: 200, message: ['User details'], data: [@user]}, status: :ok
	end

	def create
		@user = User.new(user_params)
		if @user.save
			render json: {status: 'success', code: 201, message: ['User created successfully'], data: [@user]}, status: :created
		else
			render json: {status: 'error', code: 422, message: [@user.errors.full_messages], data: []}, status: :unprocessable_entity
		end
	end

	def update
		if @user.update(user_params)
			render json: {status: 'success', code: 200, message: ['User updated successfully'], data: [@user]}, status: :ok
		else
			render json: {status: 'error', code: 422, message: [@user.errors.full_messages], data: []}, status: :unprocessable_entity
		end
	end

	def destroy
		@user.destroy
		render json: {status: 'success', code: 200, message: ['User deleted successfully'], data: []}, status: :ok
	end

	private

	def find_user
		@user = User.find_by_username!(params[:id])
		rescue ActiveRecord::RecordNotFound
			render json: { status: 'success', code: 404 , message: ['User not found'] }, status: :not_found
	end

	def user_params
		params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
