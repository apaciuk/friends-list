
set -e


rm -f /friendslist/tmp/pids/server.pid


exec "$@"
