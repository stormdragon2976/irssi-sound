use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '0.0.3';
%IRSSI = (
        authors     => 'Chrelad',
        contact     => 'blah@blah.blah',
        name        => 'alert',
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
        system("play -n synth tri 1500 tri 1800 delay 0 .12 fade h 0 .2 remix &")
}

sub part_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -n synth tri 1800 tri 1500 delay 0 .12 fade h 0 .2 remix &");
}

sub pub_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -qn -V0 synth 0.09 tri E3:B3 &");
}

#--------------------------------------------------------------------
# The sound playing function for private message
#--------------------------------------------------------------------

sub pri_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -qn -V0 synth pl G2 pl G3 pl B2 pl B3 pl D3 pl D4 pl G3 pl G4 pl D4 pl D4 pl G4 pl G4 delay 0 0 0.02 0.02 0.04 0.04 0.06 0.06 0.08 0.08 0.1 0.1 remix - phaser fade p 0 0.5 0.3 &");
}

#--------------------------------------------------------------------
# The sound playing function for nick mensioning message
#--------------------------------------------------------------------
	
sub nick_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
        system("play -qn -V0 synth 0.5 tri A3:D3 tri D3:A3 remix - &");
}

#--------------------------------------------------------------------
# Irssi::signal_add_last / Irssi::command_bind
#--------------------------------------------------------------------

Irssi::signal_add("beep", "nick_msg");Irssi::signal_add_last("message public", "pub_msg");
Irssi::signal_add_last("message private", "pri_msg");
Irssi::signal_add_last("message hilight", "nick_msg");
Irssi::signal_add("event join", 'join_msg');
#        Irssi::signal_add("event quit", 'on_quit');
        Irssi::signal_add("event part", 'part_msg');
#- end

