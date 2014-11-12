require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
  include Singleton # we only need one of these database

  def initialize
    super('questions.db')

    self.results_as_hash = true
    self.type_translation = true
  end
end