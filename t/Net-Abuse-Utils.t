# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Net-Abuse-Util.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 20;
BEGIN { use_ok('Net::Abuse::Utils') };

#########################

use Net::Abuse::Utils qw ( :all );

# these depend on network access, silly I know
# future versions will override the modules used by Net::Abuse::Utils
# to hand it static data

my $ip = '67.18.92.99';

ok ( get_abusenet_contact('linode.com') eq 'abuse@linode.com',  'abuse.net lookup'      );
ok ( get_soa_contact('209.123.233.241') eq 'dnsadmin@nac.net',  'soa contact'           );
ok ( get_ip_country($ip)                eq 'US',                'IP Country lookup'     );
ok ( !get_ip_country('127.0.0.1'),                              'IP Country lookup with bad ip');
ok ( get_rdns($ip)                      eq 'mail.linode.com',   'get_rdns'              );
ok ( (get_asn_info($ip))[0]             =~ /^\d+$/,             'ASN from IP'           );
ok ( get_asn_country(21844)             eq 'US',                'AS Country lookup'     );
ok ( !get_asn_country('urmom'),                                 'AS Country lookup w/ invalid ASN');
ok ( get_as_description(21844) eq 'THEPLANET-AS ThePlanet.com Internet Services, Inc.', 'AS Description' );
ok ( get_as_company(21844)              eq 'ThePlanet.com Internet Services, Inc.', 'AS Company' );
ok ( get_dnsbl_listing('127.0.0.2', 'bl.spamcop.net'),          'DNSBL listing check'   );
ok ( get_domain('some.co.uk')           eq 'some.co.uk',        'get_domain'            );
ok ( get_domain('host.some.co.uk')      eq 'some.co.uk',        'get_domain'            );
ok ( get_domain('some.com')             eq 'some.com',          'get_domain'            );
ok ( get_domain('host.some.com')        eq 'some.com',          'get_domain'            );
ok ( is_ip($ip),                                                'is_ip with valid ip'   );
ok ( !is_ip('192.168.293.3'),                                   'is_ip with invalid ip' );


like ( join(' ',get_ipwi_contacts('67.18.92.99')), qr/\w+@\w+/, 'whois contacts');

# internal things
ok ( !Net::Abuse::Utils::_strip_whitespace(undef), 'strip_whitespace with no input returns false');