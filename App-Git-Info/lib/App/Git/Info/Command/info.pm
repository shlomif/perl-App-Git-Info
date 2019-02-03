package App::Git::Info::Command::info;

use App::Git::Info -command;

use strict;
use warnings;
use 5.016;

sub abstract { "verify the presence of dependencies" }

sub description { return abstract(); }

sub opt_spec
{
    return ();
}

sub validate_args
{
    my ( $self, $opt, $args ) = @_;

    # no args allowed but options!
    $self->usage_error("No args allowed") if @$args;
}

sub execute
{
    my ( $self, $opt, $args ) = @_;

    my $ret =
        (     `git status` =~ s#\A(On branch \S+).*#⇒ $1#mrs . "\n"
            . `git status -s`
            . "⇒ Remotes:\n"
            . `git remote -v` );
    chomp $ret;
    say $ret;

    return;
}

1;
