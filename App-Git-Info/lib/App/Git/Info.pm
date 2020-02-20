package App::Git::Info;

use strict;
use warnings;
use 5.016;
use autodie;

use App::Cmd::Setup -app;

__END__

=head1 NAME

App::Git::Info - Displays a summary of information about the git repository.

=head1 SYNOPSIS

    shlomif[perl-begin]:$trunk$ git info info
    ⇒ On branch master
    ⇒ Your branch is up to date with 'origin/master'.
    ?? y.txt
    ⇒ Remotes:
    origin  git@github.com:shlomif/perl-begin.git (fetch)
    origin  git@github.com:shlomif/perl-begin.git (push)
    shlomif[perl-begin]:$trunk$

=head1 DESCRIPTION

Displays a git dashboard-of-sorts with info from C<git status>,
C<git status -s>, and C<git remote -v> .

=cut
