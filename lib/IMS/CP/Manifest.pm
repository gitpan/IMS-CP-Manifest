use strict;
use warnings;

package IMS::CP::Manifest;
BEGIN {
  $IMS::CP::Manifest::VERSION = '0.0.1';
}
use Moose;
with 'XML::Rabbit::RootNode';

use 5.008; # According to Perl::MinimumVersion

# ABSTRACT: IMS Content Packaging Manifest XML parser


has '+namespace_map' => (
    default => sub { {
        'cp'  => 'http://www.imsglobal.org/xsd/imscp_v1p1',
        'lom' => 'http://www.imsglobal.org/xsd/imsmd_v1p2',
    } },
);


has 'title' => (
    isa         => 'IMS::LOM::LangString',
    traits      => [qw/XPathObject/],
    xpath_query => './cp:metadata/lom:lom/lom:general/lom:title',
);


has 'organizations' => (
    isa         => 'ArrayRef[IMS::CP::Organization]',
    traits      => [qw/XPathObjectList/],
    xpath_query => '/cp:manifest/cp:organizations/*',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;


__END__
=pod

=encoding utf-8

=head1 NAME

IMS::CP::Manifest - IMS Content Packaging Manifest XML parser

=head1 VERSION

version 0.0.1

=head1 DESCRIPTION

This is a simple (read-only) parser for IMS Content Packaging manifest XML
files. The specification is available from
L<http://www.imsglobal.org/content/packaging/index.html>. It is still
incomplete, but it enables you to get access to the organization of all the
resources in the manifest and their associated files (and titles).

=head1 ATTRIBUTES

=head2 namespace_map

The prefixes C<cp> and C<lom> are declared for use in XPath queries.

=head2 title

The main title of the manifest.

=head2 organizations

A list of organizations of content. Organizations are basically different
ways to organize the content in the package, e.g. linear or hierarchial.

=for :stopwords CPAN AnnoCPAN RT CPANTS Kwalitee diff

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

  perldoc IMS::CP::Manifest

=head2 Websites

=over 4

=item *

Search CPAN

L<http://search.cpan.org/dist/IMS-CP-Manifest>

=item *

AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/IMS-CP-Manifest>

=item *

CPAN Ratings

L<http://cpanratings.perl.org/d/IMS-CP-Manifest>

=item *

CPAN Forum

L<http://cpanforum.com/dist/IMS-CP-Manifest>

=item *

RT: CPAN's Bug Tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=IMS-CP-Manifest>

=item *

CPANTS Kwalitee

L<http://cpants.perl.org/dist/overview/IMS-CP-Manifest>

=item *

CPAN Testers Results

L<http://cpantesters.org/distro/I/IMS-CP-Manifest.html>

=item *

CPAN Testers Matrix

L<http://matrix.cpantesters.org/?dist=IMS-CP-Manifest>

=item *

Source Code Repository

The code is open to the world, and available for you to hack on. Please feel free to browse it and play
with it, or whatever. If you want to contribute patches, please send me a diff or prod me to pull
from your repository :)

L<git://github.com/robinsmidsrod/IMS-CP-Manifest.git>

=back

=head2 Bugs

Please report any bugs or feature requests to C<bug-ims-cp-manifest at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=IMS-CP-Manifest>.  I will be
notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 AUTHOR

  Robin Smidsrød <robin@smidsrod.no>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Robin Smidsrød.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

