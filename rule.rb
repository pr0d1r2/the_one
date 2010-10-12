#!/usr/bin/env ruby

Dir.chdir ENV['HOME']

all = {
  'projects' => {
    'excerpt-fu-experteer'          => 'git@github.com:experteer/excerpt-fu.git',
    'central_plexus'                => 'git@github.com:doubledrones/central_plexus.git',
    'excerpt-fu'                    => 'git@github.com:doubledrones/excerpt-fu.git',
    'doubledrones.github.com'       => 'git@github.com:doubledrones/doubledrones.github.com.git',
    'coworking.czest.pl'            => 'git@github.com:doubledrones/coworking.czest.pl.git',
    'rails'                         => 'git@github.com:doubledrones/rails.git',
    'metric_fu'                     => 'git@github.com:doubledrones/metric_fu.git',
    'remarkable'                    => 'git@github.com:doubledrones/remarkable.git',
    'annotate_models'               => 'git@github.com:doubledrones/annotate_models.git',
    'i18n_routing'                  => 'git@github.com:doubledrones/i18n_routing.git',
    'most_nested_hash'              => 'git@github.com:doubledrones/most_nested_hash.git',
    'iKey_generators'               => 'git@github.com:pr0d1r2/iKey_generators.git',
    'pr0d1r2.github.com'            => 'git@github.com:pr0d1r2/pr0d1r2.github.com.git',
    'active_record_maintainers'     => 'git@github.com:pr0d1r2/active_record_maintainers.git',
    'bds'                           => 'git@github.com:pr0d1r2/bds.git',
    'paperclip-time-stamped'        => 'git@github.com:pr0d1r2/paperclip-time-stamped.git',
    'with_filled_field_scope'       => 'git@github.com:pr0d1r2/with_filled_field_scope.git',
    'geokit-gem'                    => 'git@github.com:pr0d1r2/geokit-gem.git',
    'active_record_geocodable'      => 'git@github.com:pr0d1r2/active_record_geocodable.git',
    'ipv4_address'                  => 'git@github.com:pr0d1r2/ipv4_address.git',
    'jQuery-AutoComplete-Matchable' => 'git@github.com:pr0d1r2/jQuery-AutoComplete-Matchable.git',
    'active_record_connectionless'  => 'git@github.com:pr0d1r2/active_record_connectionless.git',
    'site_assimilator'              => 'git@github.com:pr0d1r2/site_assimilator.git',
    'the_one'                       => 'git@github.com:pr0d1r2/the_one.git'
  },
  'sources' => {
    'SweetFM'                        => 'git://github.com/sweetfm/SweetFM.git',
    'workling-experteer'             => 'http://github.com/experteer/workling.git',
    'grantprix-experteer'            => 'http://github.com/experteer/grantprix.git',
    'rails-experteer'                => 'git@github.com:experteer/rails.git',
    'attribute_normalizer-experteer' => 'http://github.com/experteer/attribute_normalizer.git',
    'awesome_nested_set-experteer'   => 'http://github.com/experteer/awesome_nested_set.git',
    'gettext-experteer'              => 'http://github.com/experteer/gettext.git',
    'winnie'                         => 'http://github.com/Ragnarson/winnie.git',
    'eotb_rails_plugin-ragnarson'    => 'http://github.com/Ragnarson/eotb_rails_plugin.git'
  }
}


all.each do |directory, resources|

  Dir.mkdir("#{directory}") unless File.directory?(directory)
  Dir.chdir("#{directory}")

  resources.each do |resource_name, repository|
    puts
    puts "#{resource_name} (#{repository})"
    if File.directory?(resource_name)
      Dir.chdir(resource_name)
      system("git pull")
      Dir.chdir('..')
    else
      system("git clone #{repository} #{resource_name}")
    end
  end

  Dir.chdir('..')

end
