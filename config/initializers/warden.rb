Warden::Strategies.add(:api_token) do
  def valid?
    #request.headers['HTTP_AUTHORIZATION'].start_with?('Bearear')
    request.headers['Authorization'].present?
    #params[:token].present?
  end
  def authenticate!
    if auth_token && user_token
      success!(user_token)
    else
      fail!('Not Authenticated') 
    end 
  end 
  private
  def auth_token
    @auth_token ||= JsonWebToken.decode(request.headers['Authorization'].split(' ').last)
    # @auth_token ||=  JsonWebToken.decode(params[:token])
  end 
  def user_token
    @user_token ||= User.find(auth_token[:user_id].to_i)
  end
end
