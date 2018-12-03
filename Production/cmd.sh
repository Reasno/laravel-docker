if [ $# -gt 0 ]; then
  args=("$@")
  argn=$#

  for i in $(seq $argn)
  do
    echo "${args[$i-1]}" >> /etc/cron.d/crontasks
  done
fi

chmod 600 /etc/cron.d/crontasks
crontab /etc/cron.d/crontasks

# Start supervisord and services
/usr/bin/supervisord -n -c /etc/supervisord.conf