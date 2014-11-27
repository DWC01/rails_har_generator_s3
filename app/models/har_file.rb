class HarFile
  attr_reader :user_id, :model_name, :model_id, :id

  def initialize(export_params)
    @user_id      = export_params[:user_id]
    @model_name   = export_params[:model_name] 
    @model_id     = export_params[:model_id]
    @id           = export_params[:id]
  end
  
  def export_path
    Rails.root.join('public', 'har_files', "#{user_id}", "#{model_name}", "#{model_id}", "#{id}").to_s
  end

  def unique_path
   "/har_files/#{user_id}/#{model_name}/#{model_id}/#{id}"
  end

  def file_name
    Dir.entries(export_path).last
  end

  def file_path
    file_name = Dir.entries(export_path).last
    export_path + "/#{file_name}"
  end

  def exported_file_exists?
    Dir.exists?(export_path)
  end
    
end