#!/usr/bin/perl


use strict; 
use warnings;
use Email::MIME;
use Email::Sender::Simple qw(sendmail);



my $message = Email::MIME->create(
    header_str => [
        From => 'ismael@exemplo.com',
        To => 'maria@exemplo.com',
        Subject => 'Olá! :)',
    ],
    attributes => {
        encoding => 'quoted-printable',
        charset => 'ISO-8859-1',
    },
    body_str => "Como estás? Tudo bem?\n",
);



sendmail($message);