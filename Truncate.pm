package Text::Truncate;

use 5.00500;
use strict;

use Carp;

require Exporter;
use vars qw( $VERSION @ISA @EXPORT @EXPORT_OK $DEFAULT_MARKER );
@ISA = qw( Exporter );

@EXPORT_OK = ( @EXPORT, qw( $DEFAULT_MARKER ) );
@EXPORT = qw(
 truncstr
);
$VERSION = '0.01';

$DEFAULT_MARKER = "...";

sub truncstr
  {
    my $string = shift;
    my $cutoff = shift;
    my $marker = shift;

    $marker = $DEFAULT_MARKER, if (!defined($marker));

    croak "continued symbol is longer than the cutoff length",
      if (length($marker) > $cutoff);

    if (length($string) > $cutoff) {
      $string = substr($string, 0, $cutoff-length($marker)) . $marker;
    }

    return $string;
  }

1;
__END__

=head1 NAME

Text::Truncate - Perl module with simple string truncating routine

=head1 REQUIREMENTS

This module only uses standard modules.  It should run on Perl 5.005.

=head2 Installation

Installation is pretty standard:

  perl Makefile.PL
  make
  make test
  make install

=head1 SYNOPSIS

  use Text::Truncate;

  my $long_string = "This is a very long string";

  # outputs "This is..."
  print truncstr( $long_string, 10);

  # outputs "This is a-"
  print truncstr( $long_string, 10, "-");

  # outputs "This is a "
  print truncstr( $long_string, 10, "");

  # outputs "This is---"
  $Text::Truncate::DEFAULT_MARKER = "---";
  print truncstr( $long_string, 10);

=head1 DESCRIPTION

This is a simple, no-brainer subroutine to truncate a string and add
an optional cutoff marker (defaults to ``...'').

(Yes, this is a really brain-dead sort of thing to make a module out
of, but then again, I use it so often that it might as well be in a
module.)

The synopsis gives examples of how to use.

=head2 EXPORT

The following functions are exported:

=over

=item truncstr

  $rstring = truncstr( $istring, $cutoff_length );

  $rstring = truncstr( $istring, $cutoff_length, $continued_symbol );

If the I<$istring> is longer than the I<$cutoff_length>, then the
string will be truncated to I<$cutoff_length> characters, including
the I<$continued_symbol> (which defaults to ``...'' if none is
specified).

=back

=head1 LICENSE

This module is in the public domain. No copyright is claimed.

=head1 AUTHOR

Robert Rothenberg <rrwo@cpan.org>

=cut
