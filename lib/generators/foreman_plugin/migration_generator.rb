module ForemanPlugin
  class MigrationGenerator < Rails::Generators::Base
    class_option :plugin_name, :required => true
    class_option :plugin_source

    source_root 'db/migrate'

    hook_for :orm

    def copy_latest_migration
      destination_file = File.join(
        Dir.getwd,
        plugin_source,
        'db/migrate',
        destination_file_name
      )

      copy_file migration_file, destination_file
      remove_file File.join('db/migrate', migration_file)
    end

    private

    def destination_file_name
      File.basename(migration_file, File.extname(migration_file)) +
        ".#{plugin_name}" +
        File.extname(migration_file)
    end

    def migration_file
      @migration_file ||= begin
        full_name = Dir.glob('db/migrate/*').max_by { |f| File.mtime(f) }
        File.basename(full_name)
      end
    end

    def plugin_source
      @plugin_source ||= options[:plugin_source] || "../#{plugin_name}/"
    end

    def plugin_name
      @plugin_name ||= options[:plugin_name].underscore
    end
  end
end
