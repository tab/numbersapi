module Numbersapi

  class Client
    include HTTParty

    class << self
      def date(day, month, query = {})
        response = if day.is_a?(Integer) && month.is_a?(Integer)
          response(:date, {day: day, month: month}, query)
        else
          error("not a number")
        end
      end

      def random(query = {})
        response(:random, {}, query)
      end

      %i[math trivia year].each do |kind|
        define_method kind do |number, query = {}|
          response = if number.is_a?(Integer)
            response(kind, {number: number}, query)
          else
            error("not a number")
          end
        end
      end

      private

      def response(type, args, query = {})
        path = case type
        when :date
          "#{args[:month]}/#{args[:day]}/date"
        when :random
          "random"
        else
          "#{args[:number]}/#{type}"
        end

        return error("something went wrong") unless path

        parsed_responce = JSON.parse(HTTParty.get("http://numbersapi.com/#{path}?json", query: query)&.body)
        Hashie::Mash.new(parsed_responce)
      end

      def error(message)
        Hashie::Mash.new({ error: message })
      end
    end

  end

end