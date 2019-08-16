working_directory "/myapp"

worker_processes 2
preload_app true
timeout 30

# Set up socket location
listen "/tmp/sockets/unicorn.sock", :backlog => 64

# Logging
stderr_path "/myapp/log/unicorn.stderr.log"
stdout_path "/myapp/log/unicorn.stdout.log"

pid "/pids/unicorn.pid"
