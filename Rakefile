task default: %[test]

namespace :db do
  task :seed do
    ruby 'db/seed.rb'
  end
end

task :pry do
  exec('bundle ex pry -r ./db/seed')
end

task :test do
  ruby 'spec/fruit_spec.rb'
  ruby 'spec/vegetable_spec.rb'
  ruby 'spec/tax_spec.rb'
  ruby 'spec/tax_type_spec.rb'
end
