package LedScreen;

use Moose;
use IO::Socket;

has 'ledscreen_ip'                         => (is => 'rw');
has 'ledscreen_tcp_port'                   => (is => 'rw', default => '10001');

sub header {
    return '     FF00A0X227F00002359���3�E�b';
}

sub footer {
    return ' 979';
}

sub send_ledscreen_message {
    my $self = shift;
    my ($args) = @_;
    my ($message) = $args->{'message'};

    return 0 if (!$message);

    # It doesn't support scandinavian letters
    $message =~ tr/������/oaaOAA/;

    my $remote = IO::Socket::INET->new(
				       Proto    => 'tcp',
				       PeerAddr => $self->ledscreen_ip,
				       PeerPort => $self->ledscreen_tcp_port,
				      );
    print $remote $self->header.$message.$self->footer;
    
    return 1;
}

1;
