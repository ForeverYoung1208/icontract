Resque.logger = MonoLogger.new(File.open("#{Rails.root}/log/resque-i.log", "w+"))
Resque.logger.formatter = Resque::QuietFormatter.new

