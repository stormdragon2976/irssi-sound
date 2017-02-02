use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '0.0.3';
%IRSSI = (
        authors     => 'Chrelad',
        contact     => 'blah@blah.blah',
        name        => 'sound',
        description => 'Play sounds for different events in IRSSI.',
        url         => 'http://google.com',
        license     => 'GNU General Public License',
        changed     => '$Date: 2007-02-07 12:00:00 +0100 (Thu, 7 Feb 2008) $'
);

#--------------------------------------------------------------------
# Created by Chrelad
# Feb 7, 2008
#modified by Storm Dragon
#Added private message sound and the ability to select sound method
#Sounds now play as a background process.
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# The sound playing function for public message
#--------------------------------------------------------------------

sub join_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -qnV0 synth tri 1500 tri 1800 delay 0 .12 fade h 0 .2 remix - &. /dev/null&")
}

sub part_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -qnV0 synth tri 1800 tri 1500 delay 0 .12 fade h 0 .2 remix - &> /dev/null&");
}

sub quit_msg {
my ($server,$msg,$nick,$address,$target) = @_;
system("play -qnV0 synth pi fade h 0 1 1 pad 0 1 reverb overdrive riaa norm -7 &> /dev/null&")
}

sub pub_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -qnV0 synth 0.09 tri E3:B3 &> /dev/null&");
}
sub own_action_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -qnV0 synth 0.25 tri G5:E1 tri B5:D1 remix - norm -5 &> /dev/null&");
}

sub own_private_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -qnV0 synth pl G2 pl G3 pl B2 pl B3 pl D3 pl D4 pl G3 pl G4 pl D4 pl D4 pl G4 pl G4 delay 0 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.11 remix - phaser fade p 0 0.5 0.3 norm -3 &> /dev/null&");
}

sub action_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -qnV0 synth 0.25 tri E1:G5 tri D1:B5 remix - norm -5 &> /dev/null&");
}

sub own_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -qnV0 synth 0.09 tri B3:E3 &> /dev/null&");
}
sub own_notice_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -nqV0 synth pi fade h 0 1 1 norm -15 pad 0 1 reverb overdrive riaa speed 32 repeat 3 &> /dev/null&");
}
sub notice_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -nqV0 synth pi fade h 0 1 1 norm -15 pad 0 1 reverb overdrive riaa speed 32 reverse repeat 3 &> /dev/null&");
}

#--------------------------------------------------------------------
# The sound playing function for private message
#--------------------------------------------------------------------

sub pri_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
system("play -qnV0 synth pl G4 pl G4 pl D4 pl D4 pl D4 pl D3 pl G4 pl G3 pl B3 pl B2 pl G3 pl G2 delay 0 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.11 remix - phaser fade p 0 0.5 0.3 norm -3 &> /dev/null&");
}

#--------------------------------------------------------------------
# The sound playing function for nick mensioning message
#--------------------------------------------------------------------
	
sub hilight {
        my ($dest, $text, $stripped) = @_;
my $server = $dest->{server};
my $window = Irssi::active_server();
        if (!($server &&
                  $dest->{level} & (MSGLEVEL_HILIGHT) &&
                  $server->ischannel($dest->{target}) &&
$window->{refnum} != $dest->{window}->{refnum})) {
                return;
        }
system("play -qnV0 synth 0.5 tri A3:D3 tri D3:A3 remix - &> /dev/null&");
        }
 

#--------------------------------------------------------------------
# Irssi::signal_add_last / Irssi::command_bind
#--------------------------------------------------------------------

Irssi::signal_add_last("message public", "pub_msg");
Irssi::signal_add_last("message irc action", "action_msg");
Irssi::signal_add_last("message own_public", "own_msg");
Irssi::signal_add_last("message private", "pri_msg");
Irssi::signal_add_last("message own_private", "own_private_msg");
Irssi::signal_add_last("message irc own_action", "own_action_msg");
Irssi::signal_add_last("message irc own_notice", "own_notice_msg");
Irssi::signal_add_last("message irc notice", "notice_msg");
Irssi::signal_add_last('print text', "hilight");
Irssi::signal_add("event join", 'join_msg');
Irssi::signal_add("event quit", 'quit_msg');
Irssi::signal_add("event part", 'part_msg');
#- end
