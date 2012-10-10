require 'rails/generators'
require 'rails/generators/migration'

class SimpleTags::MigrationsGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../../../../../db/migrate', __FILE__)

  def copy_migrations
    migration_template "create_tags.rb", "db/migrate/create_tags.rb"
    migration_template "create_taggings.rb", "db/migrate/create_taggings.rb"
  end

  def self.next_migration_number( dirname )
    next_migration_number = current_migration_number(dirname) + 1
    if ActiveRecord::Base.timestamped_migrations
      [Time.now.utc.strftime("%Y%m%d%H%M%S%6N"), "%.20d" % next_migration_number].max
    else
      "%.3d" % next_migration_number
    end
  end
end
