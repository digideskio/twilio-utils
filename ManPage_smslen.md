
```
SMSLEN(1)                            BSD General Commands Manual                           SMSLEN(1)

NAME
     smslen -- Calculate SMS message payload length

SYNOPSIS
     smslen [-i encoding] [filename]

     smslen -r limit [-i encoding] [filename]

     smslen -t limit [-i encoding] [filename]

DESCRIPTION
     smslen calculates how many bytes of SMS payload are required for the given input text.

     The algorithm first attempts to encode the input using GSM 03.38, which requires seven or 14
     bits per character (depending on whether the character is an ``extension'' character).  However
     only certain commonly-used characters are encodable in GSM 03.38, so if any unsupported charac-
     ters are seen, the algorithm reverts to UTF-16 encoding for the entire message, thus requiring
     16 bits per character.

     The first form prints the number of bytes required to encode the input.

     The -r form inverts the calcaulation, printing the number of input bytes that will fit under
     the given encoded length limit.  The SMS payload limit is 140 bytes, so for example -r 140 will
     calculate how much of the input text can fit in a single SMS message.

     The -t form performs the same calculation as the -r form but copies the input to the output,
     truncating it when the calculated limit number of encoded output bytes is reached.

OPTIONS
     -i      Specify input character encoding.  By default, UTF-8 is assumed.

     -r limit
             Output the number of input bytes that, when encoded in an SMS payload, will have a
             length at most limit.

     -t limit
             Copy the input to the output up until the encoded length would reach limit.

     -h      Output usage message and exit.

EXIT STATUS
     smslen exits zero normally, or 1 if an error occurs.

     Possible errors include an invalid byte sequence in the input.

SEE ALSO
     twimsg(1), twilog(1).

     Adventures in Unicode SMS, http://www.twilio.com/engineering/2012/11/08/adventures-in-unicode-
     sms.

     Wikipedia: GSM 03.38, http://en.wikipedia.org/wiki/GSM_03.38.

AUTHOR
     Archie L. Cobbs <archie@dellroad.org>

BSD                                         May 17, 2013                                         BSD
```