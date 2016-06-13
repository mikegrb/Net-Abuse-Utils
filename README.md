# NAME

Net::Abuse::Utils - Routines useful for processing network abuse

[![Build Status](https://travis-ci.org/mikegrb/Net-Abuse-Utils.png?branch=master)](https://travis-ci.org/mikegrb/Net-Abuse-Utils)

# VERSION

version 0.25

# SYNOPSIS

    use Net::Abuse::Utils qw( :all );
    print "IP Whois Contacts: ", join( ' ', get_ipwi_contacts($ip) ), "\n";
    print "Abuse.net Contacts: ", get_abusenet_contact($domain), "\n";

# DESCRIPTION

Net::Abuse::Utils provides serveral functions useful for determining
information about an IP address including contact/reporting addresses,
ASN/network info, reverse dns, and DNSBL listing status.  Functions which take
an IP accept either IPv6 or IPv4 IPs unless indicated otherwise.

# NAME

Net::Abuse::Utils - Routines useful for processing network abuse

[![Build Status](https://travis-ci.org/mikegrb/Net-Abuse-Utils.png?branch=master)](https://travis-ci.org/mikegrb/Net-Abuse-Utils)

# VERSION

version 0.24

# CONFIGURATION

There is a `@RESOLVERS` package variable you can use to specify name servers
different than the systems nameservers for queries from this module.  If you
intend to use Google's nameservers here, please see [This issue on GitHub for
a note of caution](https://github.com/mikegrb/Net-Abuse-Utils/issues/9#issuecomment-24387435).

# FUNCTIONS

The following functions are exportable from this module.  You may import all
of them into your namespace with the `:all` tag.

## get\_asn\_info ( IP )

Returns a list containing (ASN, Network/Mask, CC code, RIR, modified date)
for the network announcing `IP`.

## get\_all\_asn\_info ( IP )

Returns a reference to a list of listrefs containting ASN(s), Network,Mask,
CC code, RIR, and modified date fall all networks announcing `IP`.

## get\_peer\_info ( IP )

IPv4 Only. Returns an array of hash references containing (ASN, Network/Mask,
CC code, RIR, modified date) for the peers of the network announcing `IP`.

## get\_as\_description ( ASN )

Returns the AS description for `ASN`.

## get\_as\_company ( ASN )

Similiar to `get_as_description` but attempts to clean it up some before
returning it.

## get\_soa\_contact( IP )

Returns the SOA contact email address for the reverse DNS /24
zone containing `IP`.

## get\_ipwi\_contacts( IP )

Returns a list of all email addresses found in whois information
for `IP` with duplicates removed.

## get\_rdns( IP )

Returns the reverse PTR for `IP`.

## get\_dnsbl\_listing( IP, DNSBL zone )

IPv4 Only. Returns the listing text for `IP` for the designated DNSBL.
`DNSBL zone` should be the zone used for looking up addresses in the
blocking list.

## get\_ip\_country( IP )

Returns the 2 letter country code for `IP`.

## get\_asn\_country( ASN )

Returns the 2 letter country code for `ASN`.

## get\_abusenet\_contact ( domain )

Returns the abuse.net listed contact email addresses for `domain`.

## is\_ip ( IP )

Returns true if `IP` looks like an IP, false otherwise.

## get\_domain ( IP )

Takes a hostname and attempts to return the domain name.

## get\_malware ( md5 )

Takes a malware md5 hash and tests it against
http://www.team-cymru.org/Services/MHR. Returns a HASHREF of last\_seen and
detection\_rate.

# DIAGNOSTICS

Each subroutine will return undef if unsuccessful.  In the furture,
debugging output will be available.

# CONFIGURATION AND ENVIRONMENT

There are two commented out lines that can be uncommented to enable Memoize
support.  I haven't yet decided whether to include this option by default.  It
may be made available in the future via an import flag to use.

# DEPENDENCIES

This module makes use of the following modules:

[Net::IP](https://metacpan.org/pod/Net::IP), [Net::DNS](https://metacpan.org/pod/Net::DNS), [Net::Whois::IP](https://metacpan.org/pod/Net::Whois::IP), and [Email::Address](https://metacpan.org/pod/Email::Address)

# BUGS AND LIMITATIONS

There are no known bugs in this module.  Please report problems to
Michael Greb (mgreb@linode.com)

Patches are welcome.

# ACKNOWLEDGEMENTS

This module was inspired by Karsten M. Self's SpamTools shell scripts,
available at http://linuxmafia.com/~karsten/.

Thanks as well to my employer, Linode.com, for allowing me the time to work
on this module.

Rik Rose, Jon Honeycutt, Brandon Hale, TJ Fontaine, A. Pagaltzis, and
Heidi Greb all provided invaluable input during the development of this
module.

# SEE ALSO

For a detailed usage example, please see examples/ip-info.pl included in
this module's distribution.

# AUTHORS

- mikegrb <michael@thegrebs.com>
- Wes Young <github@barely3am.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Mike Greb.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

# AUTHORS

- mikegrb <michael@thegrebs.com>
- Wes Young <github@barely3am.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by =over 4.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

# AUTHORS

- mikegrb <michael@thegrebs.com>
- Wes Young <github@barely3am.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by =over 4.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
