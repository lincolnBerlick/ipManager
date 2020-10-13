#!/usr/bin/perl
#tcpserver.pl
#package Instaces;
use IO::Socket::INET;
use IPs;
use Win32::Console;
use Data::Dumper;
use threads;
	



	
my @ips = IPs::readIPs();
my @ipsObject;
my $CONSOLE=Win32::Console->new;
my $size1 = scalar @ips;#!/usr/bin/perl
my $size2 = 0;
my $size3 = 0;
my $setuser = 1;


#tcpserver.pl
#package Instaces;



for (my $i = 0; $i < scalar @ips; $i++) {
	my @list = split ' ',$ips[$i];
	print $_;
	
	$ipsObject[$i] = IPs->new(IP => "$list[0]");
	
	if(scalar @list > 0){
		for(my $j = 1; $j < scalar @list; $j++){
		#print $list[$j]. "\n";
			#$ipsObject[$setuser]->setuser(user => $list[$i]);
			$ipsObject[$i]->setuser(user => $list[$j]);
	
		}
	}	
}
	

print( "==========================================GERENCIADOR DE IPS=====================================Thanks Diego/Lincoln \n");


# flush after every write
$| = 1;

my ($socket,$client_socket);
my ($peeraddress,$peerport);

# creating object interface of IO::Socket::INET modules which internally does 
# socket creation, binding and listening at the specified port address.
$socket = new IO::Socket::INET (
LocalHost => '127.0.0.1',
LocalPort => '5000',
Proto => 'tcp',
Listen => 5,
Reuse => 1
) or die "ERROR in Socket Creation : $!\n";

#print "SERVER Waiting for client connection on port 5000\n";



while(1)
{
	my $size4 = $size1*5-$size3;
	$CONSOLE->Title(sprintf("Total Ips: %d Ips em uso: %s Total Bots: %s Slots disponíveis: %s", $size1, $size2, $size3, $size4));
	my $resto = $size3 % 5;
	$size2++ if($resto < 1);
	$size3++;	

	
	
$client_socket = $socket->accept();


$peer_address = $client_socket->peerhost();
$peer_port = $client_socket->peerport();


#$data = "DATA from Server";
print $client_socket "$data\n";



my $data = <$client_socket>;
chomp($data);
my $var_control;


for $href (@ipsObject ) {
		for $role ( keys %$href ) {
		#print "$role=$href->{$role} \n";
		if($data eq $href->{$role}){
		print "Usuario já cadastrado  $data, vinculando ip $href->{'IP'} \n";
		#print "usuario enviado $href->{IP}";
		$client_socket->send($href->{IP});
		$var_control = 1;
		
		last; }
		}	}
		
		
if (!$var_control) {

	for (my $i = 0; $i < scalar @ipsObject; $i++) {
	#print "objects $ipsObject[$i]->{IP}\n";
	if (!$ipsObject[$i]->{userone}) {
		$ipsObject[$i]->setuser(user => $data);
		print "\nNew User Add  in slot ONE $ipsObject[$i]->{userone} for ip $ipsObject[$i]->{IP}\n";
		$client_socket->send($ipsObject[$i]->{IP});
		IPs::writter($ipsObject[$i]->{IP}, $ipsObject[$i]->{userone});
	
		last;
	} elsif (!$ipsObject[$i]->{usertwo}) {
		$ipsObject[$i]->setuser(user => $data);
	print "\nNew User Add  in slot TWO $ipsObject[$i]->{userone} for ip $ipsObject[$i]->{IP}\n";
		$client_socket->send($ipsObject[$i]->{IP});;
		IPs::writter($ipsObject[$i]->{IP}, $ipsObject[$i]->{usertwo});
		
		last;
	} elsif (!$ipsObject[$i]->{usertree}) {
		$ipsObject[$i]->setuser(user => $data);
		print "\nNew User Add  in slot THREE $ipsObject[$i]->{userone} for ip $ipsObject[$i]->{IP}\n";
		$client_socket->send($ipsObject[$i]->{IP});
		IPs::writter($ipsObject[$i]->{IP}, $ipsObject[$i]->{usertree});
	
		last;
	} elsif (!$ipsObject[$i]->{userfour}) {
		$ipsObject[$i]->setuser(user => $data);
		print "\nNew User Add  in slot FOUR $ipsObject[$i]->{userone} for ip $ipsObject[$i]->{IP}\n";
		$client_socket->send($ipsObject[$i]->{IP});
		IPs::writter($ipsObject[$i]->{IP}, $ipsObject[$i]->{userfour});

		last;
	} elsif (!$ipsObject[$i]->{userfive}) {
		$ipsObject[$i]->setuser(user => $data);
		print "\nNew User Add  in slot FIVE $ipsObject[$i]->{userone} for ip $ipsObject[$i]->{IP}\n";
		$client_socket->send($ipsObject[$i]->{IP});
		IPs::writter($ipsObject[$i]->{IP}, $ipsObject[$i]->{userfive});
	
		last;
	}

	
	}
}

undef $var_control;

	}

	
	
$socket->close();