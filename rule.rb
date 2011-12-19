#!/usr/bin/env ruby

Dir.chdir ENV['HOME']

all = {
  'projects' => {
    'excerpt-fu-experteer' => {
      :source => 'git@github.com:experteer/excerpt-fu.git',
    },
    'central_plexus' => {
      :source => 'git@github.com:doubledrones/central_plexus.git',
    },
    'excerpt-fu' => {
      :source => 'git@github.com:doubledrones/excerpt-fu.git',
    },
    'doubledrones.github.com' => {
      :source => 'git@github.com:doubledrones/doubledrones.github.com.git',
    },
    'coworking.czest.pl' => {
      :source => 'git@github.com:doubledrones/coworking.czest.pl.git',
    },
    'metric_fu' => {
      :source => 'git@github.com:doubledrones/metric_fu.git',
    },
    'remarkable' => {
      :source => 'git@github.com:doubledrones/remarkable.git',
    },
    'annotate_models' => {
      :source => 'git@github.com:doubledrones/annotate_models.git',
    },
    'i18n_routing' => {
      :source => 'git@github.com:doubledrones/i18n_routing.git',
    },
    'most_nested_hash' => {
      :source => 'git@github.com:doubledrones/most_nested_hash.git',
    },
    'iKey_generators' => {
      :source => 'git@github.com:pr0d1r2/iKey_generators.git',
    },
    'pr0d1r2.github.com' => {
      :source => 'git@github.com:pr0d1r2/pr0d1r2.github.com.git',
    },
    'active_record_maintainers' => {
      :source => 'git@github.com:pr0d1r2/active_record_maintainers.git',
    },
    'bds' => {
      :source => 'git@github.com:pr0d1r2/bds.git',
    },
    'paperclip-time-stamped' => {
      :source => 'git@github.com:pr0d1r2/paperclip-time-stamped.git',
    },
    'with_filled_field_scope' => {
      :source => 'git@github.com:pr0d1r2/with_filled_field_scope.git',
    },
    'geokit-gem' => {
      :source => 'git@github.com:pr0d1r2/geokit-gem.git',
    },
    'active_record_geocodable' => {
      :source => 'git@github.com:pr0d1r2/active_record_geocodable.git',
    },
    'ipv4_address' => {
      :source => 'git@github.com:pr0d1r2/ipv4_address.git',
    },
    'jQuery-AutoComplete-Matchable' => {
      :source => 'git@github.com:pr0d1r2/jQuery-AutoComplete-Matchable.git',
    },
    'active_record_connectionless' => {
      :source => 'git@github.com:pr0d1r2/active_record_connectionless.git',
    },
    'site_assimilator' => {
      :source => 'git@github.com:pr0d1r2/site_assimilator.git',
    },
    'ebook_assimilator' => {
      :source => 'git@github.com:pr0d1r2/ebook_assimilator.git',
    },
    'applicage' => {
      :source => 'git@github.com:doubledrones/applicage.git',
    },
    'polish_remote_it_worker_survey' => {
      :source => 'git@github.com:pr0d1r2/polish_remote_it_worker_survey.git',
    },
    'dotmatrix' => {
      :source => 'git@github.com:doubledrones/dotmatrix.git',
    },
    'youtubber' => {
      :source => 'git@github.com:pr0d1r2/youtubber.git',
    },
    'currencies' => {
      :source => 'git@github.com:hexorx/currencies.git',
    },
    'countries' => {
      :source => 'git@github.com:hexorx/countries.git',
    },
    'neural_processor' => {
      :source => 'git@github.com:pr0d1r2/neural_processor.git',
    },
    'the_one' => {
      :source => 'git@github.com:pr0d1r2/the_one.git',
    },
    'TVShows' => {
      :source => 'git@github.com:pr0d1r2/TVShows.git',
    },
    'things-logbook-backup' => {
      :source => 'git@github.com:pr0d1r2/things-logbook-backup.git',
    },
  },
  'sources' => {
    'SweetFM' => {
      :source => 'git://github.com/sweetfm/SweetFM.git',
    },
    'workling-experteer' => {
      :source => 'http://github.com/experteer/workling.git',
    },
    'grantprix-experteer' => {
      :source => 'http://github.com/experteer/grantprix.git',
    },
    'rails-experteer' => {
      :source => 'git@github.com:experteer/rails.git',
    },
    'attribute_normalizer-experteer' => {
      :source => 'http://github.com/experteer/attribute_normalizer.git',
    },
    'awesome_nested_set-experteer' => {
      :source => 'http://github.com/experteer/awesome_nested_set.git',
    },
    'gettext-experteer' => {
      :source => 'http://github.com/experteer/gettext.git',
    },
    'winnie' => {
      :source => 'http://github.com/Ragnarson/winnie.git',
    },
    'eotb_rails_plugin-ragnarson' => {
      :source => 'http://github.com/Ragnarson/eotb_rails_plugin.git',
    },
    'vim-robot' => {
      :source => 'https://github.com/mrmargolis/robot-vim.git',
    },
    'compass-susy-plugin' => {
      :source => 'git://github.com/ericam/compass-susy-plugin.git',
    },
    'iTerm2-gnachman' => {
      :source => 'https://github.com/gnachman/iTerm2.git'
    },
    'wycats-net-http' => {
      :source => 'https://github.com/wycats/net-http.git'
    },
  },
  'sources_svn' => {
    'iTerm2' => {
      :source => 'http://iterm2.googlecode.com/svn/trunk/'
    },
  }
}


all.each do |directory, resources|

  if directory.include?('_svn')
    svn = true
    directory = directory.gsub('_svn', '')
  else
    svn = false
  end

  Dir.mkdir("#{directory}") unless File.directory?(directory)
  Dir.chdir("#{directory}")

  resources.each do |resource_name, repository|
    puts
    puts "#{resource_name} (#{repository[:source]})"
    if File.exist?(File.join(resource_name, '.rvmrc'))
      system("rvm rvmrc trust #{resource_name}")
    end
    if File.directory?(resource_name)
      Dir.chdir(resource_name)
      if svn
        system("svn update")
      else
        system("git pull --recurse-submodules")
      end
      Dir.chdir('..')
    else
      if svn
        system("svn checkout #{repository[:source]} #{resource_name}")
      else
        system("git clone --recursive #{repository[:source]} #{resource_name}")
      end
    end
  end

  Dir.chdir('..')

end
