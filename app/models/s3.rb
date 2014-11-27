class S3
  attr_reader :s3, :bucket, :export_path, :unique_path, :file_name

  def initialize(export_path, unique_path, file_name)
    @export_path = export_path
    @unique_path = unique_path
    @file_name   = file_name
    @s3          = AWS::S3.new 
    @bucket      = s3.buckets[bucket_path]
  end

  def save_har_file
    bucket.objects[file_name].write(:file => file_path)
  end

  def bucket_path
    base_bucket_path + unique_path
  end

  def base_bucket_path
    if Rails.env.production?
      return 'displayadtech/uploads/production'
    else
      return 'displayadtech/uploads/development' 
    end
  end

  def file_path
    export_path + "/#{file_name}"
  end

end