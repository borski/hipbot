module Hipbot
  class Collection < Struct.new(:id, :name, :params)
    private_class_method :new
    alias_method :to_s, :name

    def initialize *args
      super
      self.params = OpenStruct.new(params)
    end

    def delete
      self.class.collection.delete(self.id)
    end

    class << self
      def create *args, &block
        collection[args[0]] = new(*args, &block)
      end

      def collection
        @collection ||= {}
      end

      def [] *items
        items.first.is_a?(Array) ? find_many(*items) : find_one(items.first)
      end

      def find_one item
        collection[item] || find{ |i| i.name == item }
      end

      def find_many *items
        items.flatten!
        items.map{ |i| find_one(i) }.compact.uniq
      end

      protected

      def method_missing name, *args, &block
        return collection.values.public_send(name, *args, &block) if Array.instance_methods.include?(name)
        super
      end
    end
  end
end

