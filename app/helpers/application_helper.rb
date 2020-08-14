module ApplicationHelper
    def check_photo(user)
        if user.photo.attached?
            image_tag(user.photo,:class => "img")
        else
            content_tag(:div, "No photo", class: ["img-none", "bg_gray","circle","mx-auto"])
        end
    end
    def check_cover(user)
        if user.cover_image.attached?
            image_tag(user.cover_image,:class => "cover_img")
        end
    end
    def sidebaruser(id)
        @user=User.find(id)
        render "/layouts/user_sidebar"
    end

    def whotofollow(id)
        user=User.find(id)
        @users= user.whotofollow
        render "whotofollow"
    end

    def before_yield(id)
        if id
            render "/layouts/before_yield"
        end
    end
    def after_yield(id)
        if id
            render "/layouts/after_yield"
        end
    end
    def thoughts(thoughts)
        @thoughts=thoughts
        render "/layouts/thoughts"
    end
    
    def followingstate(follower,id)
        user=User.find(id)
        if  follower.followedby.exclude?(user) and follower.id !=id
            link_to  "", follow_path(user_id:follower.id) ,class:"fas fa-plus myplus"
        end
    end
end
