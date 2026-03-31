def brew_install(package, *options)
  Rake::Task['brew_update'].invoke

  `brew list #{package}`
  return if $?.success?

  sh "brew install #{package} #{options.join ' '}"
end

def step(description)
  description = "-- #{description} "
  description = description.ljust(80, '-')
  puts
  puts "\e[32m#{description}\e[0m"
end

task :brew_update do
  `brew update`
end

namespace :install do
  desc 'Install ctags'
  task :ctags do
    step 'ctags'
    brew_install 'ctags'
  end
end

desc 'Install these config files.'
task :default do
  Rake::Task['install:ctags'].invoke

  step 'symlink'
  rm_rf File.expand_path('~/.vim')
  ln_sf File.expand_path('vim'),          File.expand_path('~/.vim'),          :verbose => true
  ln_sf File.expand_path('vimrc'),        File.expand_path('~/.vimrc'),        :verbose => true
  ln_sf File.expand_path('vimrc.local'),  File.expand_path('~/.vimrc.local'),  :verbose => true
  ln_sf File.expand_path('bashrc'),       File.expand_path('~/.bashrc'),       :verbose => true
  ln_sf File.expand_path('zshrc'),        File.expand_path('~/.zshrc'),        :verbose => true
  ln_sf File.expand_path('zprofile'),     File.expand_path('~/.zprofile'),     :verbose => true
  ln_sf File.expand_path('bash_aliases'), File.expand_path('~/.bash_aliases'), :verbose => true
  ln_sf File.expand_path('bash_profile'), File.expand_path('~/.bash_profile'), :verbose => true
  ln_sf File.expand_path('gitconfig'),    File.expand_path('~/.gitconfig'),    :verbose => true

  unless File.exist?(File.expand_path('~/.vimrc.local'))
    cp File.expand_path('vimrc.local'), File.expand_path('~/.vimrc.local'), :verbose => true
  end
end
