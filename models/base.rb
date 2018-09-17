require 'mysql2'

module Model
  class Base
    class << self
      def all
        client.query("SELECT * FROM #{table}")
      end

      def find(id)
        result = client.query("SELECT * FROM #{table} WHERE id=#{id}")
        self.new(result.first)
      end

      def where(condition)
        condition_string = nil
        condition.each { |k, v| condition_string="#{k}=#{v}" }
        rows = client.query("SELECT * FROM #{table} WHERE #{condition_string}")
        rows.map { |row| self.new(row) }
      end

      def client
        @client ||= ::Mysql2::Client.new(
          host:     ENV['APP_100CH_DB_HOST'],
          database: "100ch_production",
          username: ENV['APP_100CH_DB_USER'],
          password: ENV['APP_100CH_DB_PASSWORD']
        )
      end

      def table
        "#{self.to_s.downcase}s"
      end
    end

    def save
      model_attrs = get_model_attrs
      client.query("INSERT INTO #{table}(#{model_attrs[:names]}) VALUES(#{model_attrs[:values]})")
      self.id = client.last_id
    end

    def destroy
      id = self.id
      client.query("DELETE FROM #{table} WHERE id=#{id}")
    end

    private

    def client
      Model::Base.client
    end

    def table
      "#{self.class.to_s.downcase}s"
    end

    def get_model_attrs
      attr_names = []
      attr_values = nil

      attrs = instance_variables
      attrs.delete(:@id)

      attrs.each do |instance_variable|
        attr_names << instance_variable.to_s.slice(1..-1)
        attr_values =
          if attr_values
            "#{attr_values}, '#{instance_variable_get(instance_variable).to_s}'"
          else
            "'#{instance_variable_get(instance_variable).to_s}'"
          end
      end

      { names: attr_names.join(","), values: attr_values }
    end
  end
end
