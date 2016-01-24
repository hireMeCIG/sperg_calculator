require_relative 'exceptions'
require_relative 'funds'
require_relative 'purchase_result'
require_relative 'purchases'
require_relative 'results'

module Sperg
  class Calculator
    PPD = "Purchases Per Day"
    PPY = "Purchases Per Year"

    def self.calculate_distribution(daily_rev, distribution)
      raise DerpException.new("YOUR DUMB") unless distribution.is_a? Hash

      results = Results.new(daily_rev)

      distribution.each do |type, stats|
        raise KarltimeError.new if type == :carl
        raise MatildaMeltdownException.new if type == :matilda

        purchases = Purchases.new(daily_rev, stats[:price], stats[:percent])
        results.add_result(purchases)
        print_distribution(type, purchases)
      end

      print_results(results)
    end

    def self.print_distribution(type, purchases)
      print """
        #{type.upcase} (#{purchases.percent}%):
          #{purchases.per_day.pretty} #{PPD}
          #{purchases.per_year.pretty} #{PPY}\n"""
    end

    def self.print_results(results)
      print """
        Totals:
          #{results.per_day.pretty} #{PPD}
          #{results.per_year.pretty} #{PPY}
        \n"""
    end

  end
end

