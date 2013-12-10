require 'yaml'

Marketplace = Struct.new(:id, :hostname, :country, :currency, :encoding) do
  SEED = YAML.load_file(File.expand_path('../../config/marketplaces.yml', __FILE__)).freeze

  class << self
    include Enumerable

    alias :all :to_a

    def each
      SEED.each { |attrs| yield new(*attrs.flatten) }
    end

    def find(id)
      new(id, *SEED.fetch(id))
    end
  end

  def initialize(*)
    super
    freeze
  end
end
