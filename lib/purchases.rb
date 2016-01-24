module Sperg
  class Purchases
    attr_reader :daily_rev, :price, :percent

    # TODO: throw a warning if we instantiate a purchases object with daily_rev below 50k?
    def initialize(daily_rev, price, percent)
      @daily_rev = daily_rev
      @price     = price
      @percent   = percent
    end

    def per_day
      PurchaseResult.new(always_round_up ((daily_rev * floatify_percent(percent))/price))
    end

    # TODO: Chris said this needs to be 64 bit precision
    def floatify_percent(percent)
      percent/100.0
    end

    # Don't worry about the rounding errors
    # that's our business
    def always_round_up(amount)
      amount.to_i + 1
    end

    # kind of a moral grey-area always assuming every month is 31 days
    # but DateTime is like super hard so FUCK IT
    # plus, the backers really need to feel like we're not hemorrhaging money
    # especially the headpants sperg whales like dick wulf
    def per_month
      PurchaseResult.new(per_day.value * 31)
    end

    # TODO: raise NotEnoughMoneyException if purchases.per_year is lower than our burn rate
    # Question: Do we know our burn-rate?
    # Maybe we should automate the ship sale process, catch a NotEnoughMoneyException
    def per_year
      # ALWAYS ROUND UP!
      # EVEN WHEN YOU'VE ALREADY ROUNDED UP!!!!
      PurchaseResult.new((365 * per_day.value) + 1)
    end

  end
end