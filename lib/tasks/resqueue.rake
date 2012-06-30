require 'resque/tasks'
task "resque:setup" => :environment
task "jobs:work" => "resque:work"