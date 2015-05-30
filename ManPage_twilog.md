
```
TWILOG(1)                            BSD General Commands Manual                           TWILOG(1)

NAME
     twilog -- Download Twilio notifications and log them to syslog

SYNOPSIS
     twilog [-d] [-i] [-m] [-c config] [-f facility] [-t tag] [-s statefile]

DESCRIPTION
     twilog downloads Twilio notifications using the Twilio REST API and logs them to syslog.

     twilog keeps track of notifications already downloaded between invocations, so that only new
     notifications will be logged.

     Normally twilog would be invoked from a cron(8) script.

OPTIONS
     -c      Specify the configuration file.

             This file is simply a shell script that when sourced must define the ACCOUNT_SID and
             AUTH_TOKEN shell variables containing the corresponding Twilio credentials.

             If not specified, /etc/twilio.conf is assumed.

     -d      Run in debug mode: instead of logging notifications to syslog, print them to standard
             output.

     -f      Specify the syslog facility.  The default is user.

     -i      Include the Notification's SID in the message.

     -m      Include the notification's original timestamp in the message.

     -t      Specify the syslog tag.  The default is twilog.

     -s      Specify the state file used to maintain state between invocations.  The default is
             /var/lib/twilog/state.${ACCOUNT_SID}.

EXIT STATUS
     twilog exits zero normally, or 1 if an error occurs.

     Errors returned from the Twilio REST API are reported to standard error.

BUGS
     If more than 1000 notifications have been created since the last time twilog was run, only the
     most recent 1000 will be logged.

SEE ALSO
     cron(8), logger(1), twimsg(1), smslen(1).

AUTHOR
     Archie L. Cobbs <archie@dellroad.org>

BSD                                         May 17, 2013                                         BSD
```