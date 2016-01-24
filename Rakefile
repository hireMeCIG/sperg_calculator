require 'yaml'
require_relative 'lib/sperg_calculator'

# Use this to calculate theoretical sperg jpeg waste
task :calculate do
  daily_revenue = ENV['daily_revenue'] || 75000
  Sperg::Calculator.calculate_distribution(daily_revenue, get_distribution)
end

# curious about CIG's funding levels? hit this task like Mike Tyson in his prime yo
namespace :funds do

  task :remaining do
    puts Sperg::Funds.remaining
  end

  task :audit do
    auditor = ENV['auditor'] || "nobody important"
    puts Sperg::Funds.audit(auditor)
  end

end

def get_distribution
  get_config["distribution"]
end

def get_config
  yaml_file = File.open('sperg_config.yml', 'r')
  YAML.load(yaml_file)
end
