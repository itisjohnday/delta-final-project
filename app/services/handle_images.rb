class HandleImages
  def initialize(file, user)
    @file = file
    @user = user
  end

  def create_object
    filename = @user.username + rand(100000000..999999999).to_s + @file.original_filename
    obj = DELTA_BUCKET.object(filename)
  end

  def upload (obj)
    obj.upload_file(@file.to_io, options = {acl: 'public-read'})
    return obj
  end
end