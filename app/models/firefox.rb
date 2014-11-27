class Firefox
  attr_reader :profile
  
  def initialize
  end

  def self.export_har(url, har_export_path)
    @profile = Selenium::WebDriver::Firefox::Profile.new
    @profile.add_extension Rails.root.join('app', 'web_driver', 'firebug-2.0.6-fx.xpi')
    puts 'Init'
    puts @profile
    puts ''
    @profile.add_extension Rails.root.join('app', 'web_driver', 'netExport-0.9b6.xpi')

    # Disable Firefox auto update
    @profile["app.update.enabled"] = false
    
    # Setting Firebug preferences
    @profile["extensions.firebug.currentVersion"] = "2.0.6"
    @profile["extensions.firebug.allPagesActivation"] = "on"
    @profile["extensions.firebug.defaultPanelName"] = "net"
    @profile["extensions.firebug.net.enableSites"] = true
    
    # Setting netExport preferences
    @profile["extensions.firebug.netexport.alwaysEnableAutoExport"] = true
    @profile["extensions.firebug.netexport.showPreview"] = false
    @profile["extensions.firebug.netexport.defaultLogDir"] = har_export_path

    puts "Profile for Firefox"
    puts @profile
    driver = Selenium::WebDriver.for :firefox, profile: @profile
    sleep 1 # Allow for Firebug to startup
    driver.get url
    sleep 5 # Allow time for page load/har to export
    driver.quit
  end

  def self.screen_shot(url)
    driver.get url
    sleep 5
    driver.quit
  end
end