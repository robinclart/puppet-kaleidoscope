# Public: Install Kaleidoscope.app to /Applications.
#
# Examples
#
#   include kaleidoscope
class kaleidoscope {
  include git

  git::config::global { "difftool \"Kaleidoscope\".cmd":
    value => "ksdiff-wrapper git \"\$LOCAL\" \"\$REMOTE\""
  }

  git::config::global { "diff.tool":
    value => "Kaleidoscope"
  }

  file { "${boxen::config::bindir}/ksdiff":
    ensure  => link,
    target  => '/Applications/Kaleidoscope.app/Contents/Resources/bin/ksdiff',
    mode    => 0755,
    require => Package['Kaleidoscope'],
  }

  file { "${boxen::config::bindir}/ksdiff-wrapper":
    ensure  => link,
    target  => '/Applications/Kaleidoscope.app/Contents/Resources/bin/ksdiff-wrapper',
    mode    => 0755,
    require => Package['Kaleidoscope'],
  }

  package { 'Kaleidoscope':
    provider => 'compressed_app',
    source   => 'http://d23o3xv0lvihc9.cloudfront.net/KSUpdates/1.1.8_57/Kaleidoscope.zip',
  }
}
