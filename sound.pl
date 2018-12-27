use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '0.0.3';
%IRSSI = (
        authors     => 'Storm and Jeremiah',
        contact     => 'blah@blah.blah',
        name        => 'irssi-sound',
        description => 'Play sounds for different events in IRSSI.',
        url         => 'https://github.com/stormdragon2976/irssi-sound',
        license     => 'GNU General Public License',
        changed     => '$Date: 2007-02-07 12:00:00 +0100 (Thu, 7 Feb 2008) $'
);

#--------------------------------------------------------------------
# Created by Chrelad
# Feb 7, 2008
#modified by Storm Dragon
#Also modified by Jeremiah
#Added private message sound and the ability to select sound method
#Sounds now play as a background process.
#--------------------------------------------------------------------

my $flood_protect = 1;
my $sound_tag;

sub sound_overflow_timeout() {
    $flood_protect = 1;
    Irssi::timeout_remove($sound_tag);
}


sub join_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
  if ($server && ! Irssi::settings_get_bool("sounds")) {
    return;;
  } else {
      if (my $joincmd = Irssi::settings_get_str("join_sound_command")) {
          if ($flood_protect) {
              my $sound_flood = Irssi::settings_get_int('sound_flood');
              $sound_flood = 1000 if $sound_flood < 0;
              Irssi::timeout_remove($sound_tag);
              $sound_tag = Irssi::timeout_add($sound_flood, 'sound_overflow_timeout', undef);
              system($joincmd);
       $flood_protect = 0;
          }
}
}
}

sub part_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
  if ($server && ! Irssi::settings_get_bool("sounds")) {
    return;;
  } else {
      if (my $partcmd = Irssi::settings_get_str("part_sound_command")) {
          if ($flood_protect) {
              my $sound_flood = Irssi::settings_get_int('sound_flood');
              $sound_flood = 1000 if $sound_flood < 0;
              Irssi::timeout_remove($sound_tag);
              $sound_tag = Irssi::timeout_add($sound_flood, 'sound_overflow_timeout', undef);
              system($partcmd);
        $flood_protect = 0;
          }
      }
}
}

sub quit_msg {
my ($server,$msg,$nick,$address,$target) = @_;
  if ($server && ! Irssi::settings_get_bool("sounds")) {
    return;;
  } else {
      if (my $quitcmd = Irssi::settings_get_str("quit_sound_command")) {
          if ($flood_protect) {
              my $sound_flood = Irssi::settings_get_int('sound_flood');
              $sound_flood = 1000 if $sound_flood < 0;
              Irssi::timeout_remove($sound_tag);
              $sound_tag = Irssi::timeout_add($sound_flood, 'sound_overflow_timeout', undef);
              system($quitcmd);
        $flood_protect = 0;
      }
      }
}
}

sub pub_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
  if ($server && ! Irssi::settings_get_bool("sounds")) {
    return;;
  } else {
      if (my $pubcmd = Irssi::settings_get_str("pub_sound_command")) {
          if ($flood_protect) {
              my $sound_flood = Irssi::settings_get_int('sound_flood');
              $sound_flood = 1000 if $sound_flood < 0;
              Irssi::timeout_remove($sound_tag);
              $sound_tag = Irssi::timeout_add($sound_flood, 'sound_overflow_timeout', undef);
              system($pubcmd);
        $flood_protect = 0;
  }
      }
}
}

sub own_action_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
  if ($server && ! Irssi::settings_get_bool("sounds")) {
    return;;
  } else {
      if (my $ownactcmd = Irssi::settings_get_str("own_act_sound_command")) {
          if ($flood_protect) {
              my $sound_flood = Irssi::settings_get_int('sound_flood');
              $sound_flood = 1000 if $sound_flood < 0;
              Irssi::timeout_remove($sound_tag);
              $sound_tag = Irssi::timeout_add($sound_flood, 'sound_overflow_timeout', undef);
              system($ownactcmd);
        $flood_protect = 0;
      }
      }
}
}

sub own_private_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
  if ($server && ! Irssi::settings_get_bool("sounds")) {
    return;;
  } else {
      if (my $ownprivcmd = Irssi::settings_get_str("own_privmsg_sound_command")) {
          if ($flood_protect) {
              my $sound_flood = Irssi::settings_get_int('sound_flood');
              $sound_flood = 1000 if $sound_flood < 0;
              Irssi::timeout_remove($sound_tag);
              $sound_tag = Irssi::timeout_add($sound_flood, 'sound_overflow_timeout', undef);
              system($ownprivcmd);
        $flood_protect = 0;
      }
      }
}
}

sub action_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
  if ($server && ! Irssi::settings_get_bool("sounds")) {
    return;;
  } else {
      if (my $actcmd = Irssi::settings_get_str("action_sound_command")) {
          if ($flood_protect) {
              my $sound_flood = Irssi::settings_get_int('sound_flood');
              $sound_flood = 1000 if $sound_flood < 0;
              Irssi::timeout_remove($sound_tag);
              $sound_tag = Irssi::timeout_add($sound_flood, 'sound_overflow_timeout', undef);
              system($actcmd);
        $flood_protect = 0;
      }
      }
}
}

sub own_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
  if ($server && ! Irssi::settings_get_bool("sounds")) {
    return;;
  } else {
      if (my $ownmsgcmd = Irssi::settings_get_str("own_msg_sound_command")) {
          if ($flood_protect) {
              my $sound_flood = Irssi::settings_get_int('sound_flood');
              $sound_flood = 1000 if $sound_flood < 0;
              Irssi::timeout_remove($sound_tag);
              $sound_tag = Irssi::timeout_add($sound_flood, 'sound_overflow_timeout', undef);
              system($ownmsgcmd);
        $flood_protect = 0;
      }
      }
}
}

sub own_notice_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
  if ($server && ! Irssi::settings_get_bool("sounds")) {
    return;;
  } else {
      if (my $ownnoticecmd = Irssi::settings_get_str("own_notice_sound_command")) {
          if ($flood_protect) {
              my $sound_flood = Irssi::settings_get_int('sound_flood');
              $sound_flood = 1000 if $sound_flood < 0;
              Irssi::timeout_remove($sound_tag);
              $sound_tag = Irssi::timeout_add($sound_flood, 'sound_overflow_timeout', undef);
              system($ownnoticecmd);
        $flood_protect = 0;
      }
      }
}
}

sub notice_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
  if ($server && ! Irssi::settings_get_bool("sounds")) {
    return;;
  } else {
      if (my $noticecmd = Irssi::settings_get_str("notice_sound_command")) {
          if ($flood_protect) {
              my $sound_flood = Irssi::settings_get_int('sound_flood');
              $sound_flood = 1000 if $sound_flood < 0;
              Irssi::timeout_remove($sound_tag);
              $sound_tag = Irssi::timeout_add($sound_flood, 'sound_overflow_timeout', undef);
              system($noticecmd);
        $flood_protect = 0;
      }
      }
}
}

sub pri_msg {
        my ($server,$msg,$nick,$address,$target) = @_;
  if ($server && ! Irssi::settings_get_bool("sounds")) {
    return;;
  } else {
      if (my $privmsgcmd = Irssi::settings_get_str("privmsg_sound_command")) {
          if ($flood_protect) {
              my $sound_flood = Irssi::settings_get_int('sound_flood');
              $sound_flood = 1000 if $sound_flood < 0;
              Irssi::timeout_remove($sound_tag);
              $sound_tag = Irssi::timeout_add($sound_flood, 'sound_overflow_timeout', undef);
              system($privmsgcmd);
        $flood_protect = 0;
      }
      }
}
}

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
  if ($server && ! Irssi::settings_get_bool("sounds")) {
    return;;
  } else {
      if (my $hilightcmd = Irssi::settings_get_str("hilight_sound_command")) {
          if ($flood_protect) {
              my $sound_flood = Irssi::settings_get_int('sound_flood');
              $sound_flood = 1000 if $sound_flood < 0;
              Irssi::timeout_remove($sound_tag);
              $sound_tag = Irssi::timeout_add($sound_flood, 'sound_overflow_timeout', undef);
              system($hilightcmd);
        $flood_protect = 0;
      }
      }
        }
}

#add settings and defaults
Irssi::settings_add_bool("lookandfeel", "sounds", 1);
Irssi::settings_add_int("lookandfeel", "sound_flood", 250);
Irssi::settings_add_str("misc", "join_sound_command",
"play -qnV0 synth tri 1500 tri 1800 delay 0 .12 fade h 0 .2 remix - &. /dev/null&");
Irssi::settings_add_str("misc", "part_sound_command",
"play -qnV0 synth tri 1800 tri 1500 delay 0 .12 fade h 0 .2 remix - &> /dev/null&");
Irssi::settings_add_str("misc", "quit_sound_command",
"play -qnV0 synth pi fade h 0 1 1 pad 0 1 reverb overdrive riaa norm -7 &> /dev/null&");
Irssi::settings_add_str("misc", "pub_sound_command",
"play -qnV0 synth 0.09 tri E3:B3 &> /dev/null&");
Irssi::settings_add_str("misc", "own_act_sound_command",
"play -qnV0 synth 0.25 tri G5:E1 tri B5:D1 remix - norm -5 &> /dev/null&");
Irssi::settings_add_str("misc", "own_privmsg_sound_command",
"play -qnV0 synth pl G2 pl G3 pl B2 pl B3 pl D3 pl D4 pl G3 pl G4 pl D4 pl D4 pl G4 pl G4 delay 0 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.11 remix - phaser fade p 0 0.5 0.3 norm -3 &> /dev/null&");
Irssi::settings_add_str("misc", "action_sound_command",
"play -qnV0 synth 0.25 tri E1:G5 tri D1:B5 remix - norm -5 &> /dev/null&");
Irssi::settings_add_str("misc", "own_msg_sound_command",
"play -qnV0 synth 0.09 tri B3:E3 &> /dev/null&");
Irssi::settings_add_str("misc", "own_notice_sound_command",
"play -nqV0 synth pi fade h 0 1 1 norm -15 pad 0 1 reverb overdrive riaa speed 32 repeat 3 &> /dev/null&");
Irssi::settings_add_str("misc", "notice_sound_command",
"play -nqV0 synth pi fade h 0 1 1 norm -15 pad 0 1 reverb overdrive riaa speed 32 reverse repeat 3 &> /dev/null&");
Irssi::settings_add_str("misc", "privmsg_sound_command",
"play -qnV0 synth pl G4 pl G4 pl D4 pl D4 pl D4 pl D3 pl G4 pl G3 pl B3 pl B2 pl G3 pl G2 delay 0 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.11 remix - phaser fade p 0 0.5 0.3 norm -3 &> /dev/null&");
Irssi::settings_add_str("misc", "hilight_sound_command",
"play -qnV0 synth 0.5 tri A3:D3 tri D3:A3 remix - &> /dev/null&");
#add Signals
Irssi::signal_add_last("message public", "pub_msg");
Irssi::signal_add_last("message irc action", "action_msg");
Irssi::signal_add_last("message own_public", "own_msg");
Irssi::signal_add_last("message private", "pri_msg");
Irssi::signal_add_last("message own_private", "own_private_msg");
Irssi::signal_add_last("message irc own_action", "own_action_msg");
Irssi::signal_add_last("message irc own_notice", "own_notice_msg");
Irssi::signal_add_last("message irc notice", "notice_msg");
Irssi::signal_add_last('print text', "hilight");
Irssi::signal_add_last("event join", 'join_msg');
Irssi::signal_add_last("event quit", 'quit_msg');
Irssi::signal_add_last("event part", 'part_msg');
Irssi::signal_add_last("event kick", 'part_msg');
#- end
