credentials = Aws::Credentials.new(Rails.application.secrets.aws_access_key_id, Rails.application.secrets.aws_secret_access_key)

Aws.config.update({
  region: 'us-east-1',
  credentials: credentials
})

client = Aws::S3::Client.new
resource = Aws::S3::Resource.new(client: client)
DELTA_BUCKET = resource.bucket(Rails.application.secrets.s3_bucket)