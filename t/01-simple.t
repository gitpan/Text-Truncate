use Test;
BEGIN { plan tests => 1234 };
use Text::Truncate;
ok(1); # If we made it this far, we're ok.

my $mark_len = length($Text::Truncate::DEFAULT_MARKER);

sub _min { my ($a,$b) = @_; if ($a<$b) { return $a; } else { return $b; } }

ok($mark_len == 3);

for (my $str_len = 0; $str_len<($mark_len+10); $str_len++) {
  my $str = "A" x $str_len;
  for (my $trunc_len = $mark_len; $trunc_len<($mark_len+13); $trunc_len++) {
    my $res = truncstr($str, $trunc_len);
    # print $str, " ", $res, "\n";
    ok(length($res) == _min($trunc_len, $str_len));
    if (length($res) < length($str)) {
      ok($res =~ m/$Text::Truncate::DEFAULT_MARKER$/);
    } else {
      ok($res eq $str);
    }
  }
}

my $alternate = "11";
ok(length($alternate) != $mark_len);

$mark_len = length($alternate);

for (my $str_len = 0; $str_len<($mark_len+10); $str_len++) {
  my $str = "A" x $str_len;
  for (my $trunc_len = $mark_len; $trunc_len<($mark_len+13); $trunc_len++) {
    my $res = truncstr($str, $trunc_len, $alternate);
    # print $str, " ", $res, "\n";
    ok(length($res) == _min($trunc_len, $str_len));
    if (length($res) < length($str)) {
      ok($res =~ m/$alertnate$/);
    } else {
      ok($res eq $str);
    }
  }
}

$alternate = "1111";
ok(length($alternate) != $mark_len);

$mark_len = length($alternate);

for (my $str_len = 0; $str_len<($mark_len+10); $str_len++) {
  my $str = "A" x $str_len;
  for (my $trunc_len = $mark_len; $trunc_len<($mark_len+13); $trunc_len++) {
    my $res = truncstr($str, $trunc_len, $alternate);
    # print $str, " ", $res, "\n";
    ok(length($res) == _min($trunc_len, $str_len));
    if (length($res) < length($str)) {
      ok($res =~ m/$alertnate$/);
    } else {
      ok($res eq $str);
    }
  }
}

$alternate = "";
ok(length($alternate) != $mark_len);

$mark_len = length($alternate);

for (my $str_len = 0; $str_len<($mark_len+10); $str_len++) {
  my $str = "A" x $str_len;
  for (my $trunc_len = $mark_len; $trunc_len<($mark_len+13); $trunc_len++) {
    my $res = truncstr($str, $trunc_len, $alternate);
    # print $str, " ", $res, "\n";
    ok(length($res) == _min($trunc_len, $str_len));
    if (length($res) < length($str)) {
    } else {
      ok($res eq $str);
    }
  }
}
