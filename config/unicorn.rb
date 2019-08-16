# working_directory "/myapp"

worker_processes 1
preload_app true
timeout 30

# Set up socket location
listen "/tmp/docker.sock", :backlog => 64

# Logging
# stderr_path "/logs/unicorn.stderr.log"
# stdout_path "/logs/unicorn.stdout.log"

# pid "/pids/unicorn.pid"
