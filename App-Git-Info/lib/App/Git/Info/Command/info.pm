package App::Git::Info::Command::info;

use App::Git::Info -command;

use strict;
use warnings;
use autodie;
use 5.016;

sub abstract
{
    return "Displays a summary of information about the git repository.";
}

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

    my $ST = `git status`;
    if ($?)
    {
        return;
    }

    my $ret =
        ( $ST =~
s#\A(On branch \S+\n)((?:\S[^\n]*\n)?).*#"⇒ $1".($2 ? "⇒ $2" : "")#emrs
            . `git status -s`
            . "⇒ Remotes:\n"
            . `git remote -v` );
    chomp $ret;
    say $ret;

    return;
}

1;
