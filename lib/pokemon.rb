class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(id:nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save

  end

  def self.find

  end
end
