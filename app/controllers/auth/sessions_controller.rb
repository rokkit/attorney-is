class Auth::SessionsController < Devise::SessionsController

  # GET /resource/sign_in
  def new
     self.resource = build_resource(nil, :unsafe => true)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end
  # POST /resource/sign_in
  def create

   self.resource = warden.authenticate!(auth_options)
   #unless self.resource.admin?
      #new_password = Devise.friendly_token.first(7)
      #self.resource.update_attribute :password, new_password
      #Sms.inform self.resource.phone, "Пароль для входа: #{new_password}"
    #end
    sign_in(resource_name, resource)
    respond_with resource, :location => after_sign_in_path_for(resource)
  end
end
