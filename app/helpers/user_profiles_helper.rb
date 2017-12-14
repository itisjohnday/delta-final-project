module UserProfilesHelper

def logged (input)
  if current_user && current_user.id = params[:id]
    return input
  end
end  

end
