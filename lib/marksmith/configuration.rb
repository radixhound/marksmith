module Marksmith
  class Configuration
    include ActiveSupport::Configurable

    config_accessor(:automatically_mount_engine) { true }
    config_accessor(:mount_path) { "/marksmith" }
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
