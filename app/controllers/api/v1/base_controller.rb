class Api::V1::BaseController < ApplicationController
	def not_found
		render json: { error: 'not_found' }
	end

	def authorize_request
		header = request.headers['Authorization']
		header = header.split(' ').last if header
		begin
			@decoded = JsonWebToken.decode(header)
			@current_user = User.find(@decoded[:user_id])
		rescue ActiveRecord::RecordNotFound => e
			render json: { status: 'error', code: 401, message: [e.message], data: [] }, status: :unauthorized
		rescue JWT::DecodeError => e
			render json: { status: 'error', code: 401, message: [e.message], data: [] }, status: :unauthorized
		end
	end
end
