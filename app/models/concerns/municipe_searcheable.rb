module MunicipeSearcheable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      indexes :name, type: :string
      indexes :cpf, type: :string
      indexes :cns, type: :string
      indexes :email, type: :string
    end

    def self.search(query)
      __elasticsearch__.search(query)
    end
  end
end
