use Module::Build;

my $build = Module::Build->new
    (
     module_name => 'Text::Truncate',
     license => 'unrestricted', # *Ahem* PUBLIC DOMAIN
     requires => {
       'perl'        => 5.004,
       'Carp'        => 0,
     },
     recommends => {
     },
     build_requires => {
       'Test'        => 0,
     },
     create_makefile_pl => 'traditional',
     dist_author        => 'Robert Rothenberg <rrwo at cpan.org>',
);

$build->create_build_script;
