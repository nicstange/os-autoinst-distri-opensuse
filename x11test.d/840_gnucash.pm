use base "basetest";
use bmwqemu;

sub run() {
    my $self = shift;
    ensure_installed("gnucash");
    ensure_installed("gnucash-docs");

    # needed for viewing
    ensure_installed("yelp");
    x11_start_program("gnucash");
    $self->check_screen;
    sendkey "ctrl-h";    # open user tutorial
    waitidle 5;
    $self->check_screen;
    sendkey "alt-f4";    # Leave tutorial window
                         # Leave tips windows for GNOME case
    if ( $ENV{DESKTOP} eq "gnome" || $ENV{DESKTOP} eq "xfce" ) { sleep 3; sendkey "alt-c"; }
    waitidle;
    sendkey "ctrl-q";    # Exit
}

1;
