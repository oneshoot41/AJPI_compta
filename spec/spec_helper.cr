ENV["AMBER_ENV"] ||= "development"

require "spec"
require "micrate"
require "garnet_spec"

require "../config/*"

Micrate::DB.connection_url = Amber.settings.database_url

# Automatically run migrations on the test database
Micrate::Cli.run_up

# Disable Granite logs in tests
Granite.settings.logger = nil
