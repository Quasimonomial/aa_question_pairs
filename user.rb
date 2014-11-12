require_relative 'question'
require_relative 'questions_database'
require_relative 'question_follow'

class User
  def self.all
    results = QuestionsDatabase.instance.execute('SELECT * FROM users')
    resutls.map { |result| User.new(result) }
  end

  def self.find_by_name(fname, lname)
    attrs = {fname: fname, lname: lname}

    results = QuestionsDatabase.instance.execute(<<-SQL, attrs)
      SELECT *
      FROM users
      WHERE fname = :fname AND lname = :lname


    SQL

    results.map{ |result| User.new(result)}

  end
  
  def self.find_by_id id
    attrs = { id: id }
    result = QuestionsDatabase.instance.execute(
      'SELECT * FROM users WHERE users.id = :id', attrs)
    User.new(result)
  end

  attr_accessor :id, :fname, :lname

  def initialize(options = {})
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end


end