package Game::Conway;
use Dancer ':syntax';

use URI;
use Text::CSV;
use Spreadsheet::HTML;

our $VERSION = '0.01';

get '/' => sub { template 'index' };

get '/table' => sub {

    my $html = Spreadsheet::HTML->new;
    my $params = {};
    my @args = ();

    for (qw( fade )) {
        my $val = params->{$_} || '';
        push @args, ( $_ => 1 ) if $val eq 'true';
    }

    for (qw( rows cols on off wechsler alpha )) {
        my $val = params->{$_};
        next unless length $val;
        $val = undef if $val eq 'undef';
        $val = '' if $val eq "''";
        push @args, ( $_ => $val );
    }

    if (my $uri = params->{url}) {
        $uri = URI->new( $uri, 'http' );
        push @args, ( file => $uri ) if $uri->scheme;
    }

    unless (params->{wechsler}) {
        my $rows = params->{rows} || 20;
        my $cols = params->{cols} || 20;
        $rows = 20 if $rows =~ /\D/;
        $cols = 20 if $cols =~ /\D/;
        push @args, ( fill => "${rows}x${cols}" );
    }

    $params = {
        output  => scalar $html->conway( @args ),
    };

    template 'table', $params, { layout => undef };
};

true;
