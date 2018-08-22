package App::Git::Info;

# ABSTRACT: Displays a summary of information about the git repository.

use strict;
use warnings;
use 5.016;

package main;

use App::Rad;

sub run
{
    return App::Rad->run;
}

sub info
{
    my $ret =
        (     `git status` =~ s#\A(On branch \S+).*#⇒ $1#mrs . "\n"
            . `git status -s`
            . "⇒ Remotes:\n"
            . `git remote -v` );
    chomp $ret;
    return $ret;
}

1;

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
