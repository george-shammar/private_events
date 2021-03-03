module ApplicationHelper
    def navbar_button_name(user)
        link_to user.name, '/',  class: 'btn btn-light mx-1' if user_signed_in?
    end
    
    def navbar_button_new_event
        link_to 'New Event', new_event_path, class: 'btn btn-primary mx-1' if user_signed_in?
    end
    
    def navbar_button_log_out
        link_to 'Log out', logout_path, method: :delete, class: 'btn btn-primary mx-1' if user_signed_in?
    end
    
    def navbar_button_sign_up
        link_to 'Sign up', new_user_path, class: 'btn btn-primary mx-1' unless user_signed_in?
    end
    
    def navbar_button_log_in
        link_to 'Sign in',login_path, class: 'btn btn-primary mx-1' unless user_signed_in?
    end

    def user_signed_in?
        !current_user.nil?
    end
end
