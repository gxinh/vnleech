module SessionsHelper
    
    def sign_in(user)
        session[:user_id] = user.id
        self.current_user = user
    end
    
    def current_user=(user)
        @current_user = user
    end
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def signed_in?
        !current_user.nil?
    end
    
    def sign_out
        session[:user_id] = nil
        self.current_user = nil
    end
    
    def current_user?(user)
        user == current_user
    end
    
    def deny_access
        redirect_to root_path, :notice => "Pleas sign in to access this page."
    end
    
    def is_admin
        if self.current_user.role.name == "Admin"
            true
        else
            false
        end
    end
    
end
