Warden::Strategies.add(:api_token) do
    def valid?
        request.headers['Authorization'].present?
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
    end 
    def user_token
        @user_token ||= User.find(auth_token[:user_id].to_i)
    end
end
