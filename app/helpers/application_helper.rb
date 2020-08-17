module ApplicationHelper
  def check_photo(user)
    if user.photo.attached?
      image_tag(user.photo, class: 'img')
    else
      content_tag(:div, 'No photo', class: %w[bg_gray circle img-none])
    end
  end

  def check_cover(user)
    image_tag(user.cover_image, class: 'cover_img') if user.cover_image.attached?
  end

  def sidebaruser(id)
    @user = User.find(id)
    render '/layouts/user_sidebar'
  end

  def whotofollow(id)
    user = User.find(id)
    @users = user.whotofollow
    render 'whotofollow'
  end

  def before_yield(id)
    render '/layouts/before_yield' if id
  end

  def thoughts(thoughts)
    @thoughts = thoughts
    render '/layouts/thoughts'
  end

  def followingstate(follower, id)
    user = User.find(id)
    if user.followeds.exclude?(follower) && (follower.id != id)
      link_to '', followings_path(user_id: follower.id), method: :post,
                                                         class: 'fas fa-plus middle follostate myplus', id: 'follow_id'
    elsif user.followeds.include?(follower) && (follower.id != id)
      link_to '', following_path(id: follower.id), method: :delete,
                                                   class: 'far fa-times-circle middle follostate myunfollow',
                                                   id: 'unfollow_id'
    end
  end

  def usercard(user)
    @user = user
    render 'userinfo'
  end
end
