package IPs;

use strict;
use Exporter;
use IO::Socket::INET;

our @ISA = qw(EXPORT);
our @EXPORT = qw(_readIPs);

sub _new {
	my ($class, $host, $port) = @_;
	print "class $class host $host port $port\n";
	my $socket = new IO::Socket::INET(
		LocalHost => $host,
		LocalPort => $port,
		Proto => 'tcp'
	);
	return $socket;
}

sub new {
	my ($class, %args) = @_;
	#print"$class $args{IP}\n";
	my $self = {
		userone => undef,
		usertwo => undef,
		usertree => undef,
		userfour => undef,
		userfive => undef,
		IP => $args{IP},
	};
	bless $self, $class;
}

sub setuser {
	my ($self, %args) = @_;
	if (!defined $self->{userone}) {
		$self->{userone} = $args{user};
	} elsif (!defined $self->{usertwo}) {
		$self->{usertwo} = $args{user};
	} elsif (!defined $self->{usertree}) {
		$self->{usertree} = $args{user};
	} elsif (!defined $self->{userfour}) {
		$self->{userfour} = $args{user};
	} elsif (!defined $self->{userfive}) {
		$self->{userfive} = $args{user};
	}
}

sub countClients {
	
}

sub readIPs {
	my @ips_list;
	open (IPS, "<ips.txt") or die "Error: file cannot be found: ips.txt\n";
	my $read_ip_section;
	my $i = 0;
	print "reading IPS\n";
	while (<IPS>) {
		chomp;
		
		#$_ =~ s/\s+//; # remove all spaces
		$_ =~ s/\r?\n|\r//g; # remove linebreak
		#if ($_ =~ /(\d+)/) { # parse only numbers
		#$_ =~ s/\.//g;
		if ($_ =~ /\[IPs\]/) {
			$read_ip_section = 1;
		} elsif ($read_ip_section) {
			push (@ips_list, $_);
		}
		#}
	}
	close IPS;
	return @ips_list;
}


	sub writter {
	my ($args, $self) = @_;
	#print ("ip recebido $args user recebido $self\n");
	my $file = 'ips.txt';
	my $tmp = 'ips.txt.tmp';

	open my $in,'<', $file;
	open my $out, ">$tmp";
	my @lines = <$in>;
		for (@lines) {
		#print $_;
			my @newlines = split / /,$_;
			chomp(@newlines);
			#print $newlines[0];
			#print "aqui newline $newlines[0] e \$args $args\n";
				if ($newlines[0] eq $args) {
			#	print "passei aki \n";
				#push @lines, $self;
				chomp($_);
				$_ .= " $self\n";
				}
				print $out $_;		}
				
	close $in;
	close $out;
	rename ( $tmp, $file );
				}

1;