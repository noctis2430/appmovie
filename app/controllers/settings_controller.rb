class SettingsController < ApplicationController
	before_action :authenticate_user!
	layout "admin"

	def index
		def index
        @setting = current_user.setting
        
        @payment = current_user.payments
    end
	end

	def show
		@setting = setting.find(params[:id])
	end	

	def new  	
		@setting = current_user.build_setting
  	#@setting = Setting.new #hack
  end

  def create
  	@setting = current_user.build_setting(setting_params)
  	if @setting.save
  		redirect_to settings_path :notice => "Se han guardado el pais e idioma"
  	else
  		render :new
  	end
  end

  def edit 
  	@setting = Setting.find(params[:id])
  end

  def update
  	@setting = Setting.find(params[:id])
  	if @setting.update_attributes(setting_params)
  		redirect_to settings_path
  	else
  		render :index
  	end
  end
  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy
    redirect_to settings_path, :notice => "Borrado"
  end

  def setting_params
  	params.require(:setting).permit(:language, :country)
  end
end
