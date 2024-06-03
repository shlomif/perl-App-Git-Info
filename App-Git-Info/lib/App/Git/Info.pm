package App::Git::Info;

use strict;
use warnings;
use 5.016;
use autodie;

sub new
{
    my $class = shift;

    my $self = bless {}, $class;

    $self->_init(@_);

    return $self;
}

sub _argv
{
    my $self = shift;

    if (@_)
    {
        $self->{_argv} = shift;
    }

    return $self->{_argv};
}

sub _init
{
    my ( $self, $args ) = @_;

    my $argv = $args->{argv} or die "specify argv";

    $self->_argv( [ @{$argv} ] );

    return;
}

sub _abstract
{
    return "Displays a summary of information about the git repository.";
}

sub _description { return _abstract(); }

sub _opt_spec
{
    return ();
}

sub _validate_args
{
    my ( $self, $opt, $args ) = @_;

    # no args allowed but options!
    $self->usage_error("No args allowed") if @$args;

    return;
}

sub _execute
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

sub run
{
    my $self = shift;
    my $argv = [ @{ $self->_argv() } ];

    if ( not @$argv )
    {
        die
qq#Must include a verb/action command - e.g "git-info info" or "git-info help"#;
    }

    my $cmd = shift @$argv;

    if ( $cmd eq "info" )
    {
        return $self->_execute( undef(), $argv, );
    }
    elsif ( $cmd eq "help" )
    {
        print <<'ENDOFHELP';
git-info info - Displays a summary of information about the git repository.

ENDOFHELP
    }
    else
    {
        die "must be git-info info!";
    }
}

1;
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

=head1 METHODS

=head2 my $app = App::Git::Info->new({ argv => [@ARGV], })

Create a git-info app.

=head2 $app->run()

Run the git-info app.

=cut
