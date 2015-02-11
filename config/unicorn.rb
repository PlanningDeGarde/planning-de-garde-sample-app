# https://gist.github.com/nathany/5058140

worker_processes Integer(ENV['UNICORN_WORKERS'] || 2)
timeout Integer(ENV['UNICORN_TIMEOUT'] || 25)
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection

  # Dalli does not need anything special in Unicorn/Passenger since 2.0.4. It will
  # detect sockets shared with child processes and gracefully reopen the socket.
  # https://github.com/mperham/dalli/issues/208

  # Redis/Resque and other external services may need special handling:
  # https://devcenter.heroku.com/articles/rails-unicorn
end