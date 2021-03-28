require "httparty"
require "hashie"
require "numbersapi/version"

module Numbersapi
  autoload :Client, "numbersapi/client"

  extend self

  def date(*args)
    Client.date(*args)
  end

  def random(*args)
    Client.random(*args)
  end

  def math(*args)
    Client.math(*args)
  end

  def trivia(*args)
    Client.trivia(*args)
  end

  def year(*args)
    Client.year(*args)
  end

end
