ActiveSupport.on_load :active_record do
  # rubocop:disable Lint/ConstantDefinitionInBlock
  module CreateTableWithRowFormat
    def create_table(table_name, options = {})
      table_options = options.merge(options: 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC')
      super(table_name, table_options) do |td|
        yield td if block_given?
      end
    end
  end
  # rubocop:enable Lint/ConstantDefinitionInBlock
  ActiveRecord::ConnectionAdapters::AbstractMysqlAdapter.prepend CreateTableWithRowFormat
end
