module ApplicationHelper
    def check_photo(user)
        if user.photo.attached?
            image_tag(user.photo,:class => "img")
        end
    end
    def sidebaruser(id)
        @user=User.find(id)
        render "/layouts/user_sidebar"
    end
end
