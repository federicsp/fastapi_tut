#!/bin/sh

export APP_MODULE=${APP_MODULE-app.main:app}. #export: is used to ensure the environment variables and functions to be passed to child processes.
#check https://medium.com/p/2baf6bcb9091/edit
export HOST=${HOST:-0.0.0.0} 
# - means "use the default value if the parameter is unset." So for example,
#${PID-/run/unicorn.pid}
#equals $PID if $PID is set, otherwise /run/unicorn.pid
export PORT=${PORT:-8001}

exec uvicorn --reload --host $HOST --port $PORT "$APP_MODULE"
