source 'http://rubygems.org'

gem "rails", "3.0.9"
gem "mysql", "2.8.1"

gem "exception_notification"
gem "pagseguro"
gem "symbolize"

group :development, :test do
	gem "capistrano"
	gem "ruby-debug19", :require => "ruby-debug"
	
	gem "rspec-rails"
	gem "guard-rspec"
	
	if RUBY_PLATFORM =~ /darwin/i
    gem "growl"
    gem 'rb-fsevent', :require => false
  elsif RUBY_PLATFORM =~ /linux/i
    gem "libnotify"
    gem "rb-inotify"
  end
 end
