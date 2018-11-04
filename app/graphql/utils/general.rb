module Utils::General
  extend self

  def authorized(user)
    if user
      true
    else
      false
    end
  end

  def authorized_yuki(user)
    if user && user.id == 1
      true
    else
      false
    end
  end
end