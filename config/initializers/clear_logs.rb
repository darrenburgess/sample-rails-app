if Rails.env.development?
  MAX_LOG_SIZE = 10.megabytes
  
  logs = [ File.join(Rails.root, 'log', 'development.log'), File.join(Rails.root, 'log', 'test.log') ]

  logs.each do |log|
    log_size = File.size?(log).to_i
    if log_size > MAX_LOG_SIZE
      $stdout.puts "Removing Log: #{log}"
      `rm #{log}`
    end
  end 
end