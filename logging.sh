#! /bin/bash

# The syslog standard uses facilities and severities to categorize messages
# Facilities - labels tell which application or part generated the error. Examples - kern,user,mail,daemon,auth,local0,local7
# Severities - emerg, alert, crit, err, warning, notice, info, debug

# Logging with logger
# logger -p facility.severity "Message"
# shift

/usr/bin/logger $(printenv)
/usr/bin/logger -s -p user.info "Processing"


