package App::Git::Info;

# ABSTRACT: Displays a summary of information about the git repository.

use strict;
use warnings;
use 5.016;
use autodie;

use App::Cmd::Setup -app;

__END__

=head1 NAME

=head1 SYNOPSIS

    shlomif@telaviv1:~/conf/trunk$ git info info
    ⇒ On branch master
     M shlomif-settings/home-bin-executables/bin/git-i
    ⇒ Remotes:
    origin  git@github.com:shlomif/shlomif-computer-settings.git (fetch)
    origin  git@github.com:shlomif/shlomif-computer-settings.git (push)
    shlomif@telaviv1:~/conf/trunk$

=head1 METHODS

=head2 info

Implement the info subcommand.

=cut
