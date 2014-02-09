require 'rubygems'
require 'puppet-lint/tasks/puppet-lint'


task :syntax do
  validate = Dir.glob('**/*.pp')
  validate.unshift("puppet parser validate")

  # Run syntax checker in subprocess.
  system(*validate)

end


# Ignore check for lines longer that 80 character
PuppetLint.configuration.send("disable_80chars")
# Ignore check for code not compatible with Puppet 2.6.2 and earlier
PuppetLint.configuration.send('disable_class_inherits_from_params_class')
#PuppetLint.configuration.ignore_paths = ["example/**/*.pp"]


desc "Test YAML files"
task :yaml do
  require 'yaml'

  successes = []
  failures = []
  Dir.glob(['**/*.yaml', '**/*.eyaml']).each do |yaml_file|
#    puts "Checking syntax for #{yaml_file}"

    begin
      f = YAML.load_file(yaml_file)
      successes << yaml_file
    rescue Exception
      puts "Failed to read #{yaml_file}: #{$!}"
      failures << yaml_file
    end
  end

  # Print the results.
  total_yaml = successes.count + failures.count
  puts "#{total_yaml} yaml files total."
  puts "#{successes.count} yaml files succeeded."
  puts "#{failures.count} yaml files failed:"
  puts
  failures.each do |filename|
    puts filename
  end

  # Fail the task if any files failed syntax check.
  if failures.count > 0
    fail("#{failures.count} filed failed yaml syntax check.")
  end
end

task :rspec do
  require 'puppetlabs_spec_helper/rake_tasks'
  Rake::Task['spec'].execute
end

desc 'Run all tests.'
task :default => ['syntax', 'lint', 'yaml']
