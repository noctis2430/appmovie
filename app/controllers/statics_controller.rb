class StaticsController < ApplicationController
	skip_before_action :authenticate_user!
  # def index
  # 	@setting = current_user.setting
  # end

  # def show
  # 	@setting = current_user.setting
  # end

  # def new
  # 	@setting = current_user.setting.new
  # end

  # def create
  # 	@setting = current_user.setting.new(setting_params)
  # 		if @setting.save
  # 			redirect_to settings_path
  # 		else
  # 			render :new
  # 		end
  # end

  # def edit
  # 	@setting = current_user.setting.find(params[:id])
  # 	if @setting.update_attributes(setting_params)
  # 		redirect_to settings_path
  # 	else
  # 		render :index
  # 	end

  # 	private
  # 	def setting_params
  # 		params.require(:setting).permit(:language, :country)
  # 	end
  # end

  # def about
  # end
end
