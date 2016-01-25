module Sperg
  class Purchases
    attr_reader :daily_rev, :price, :percent

    # TODO: print a warning if we instantiate a purchases object with daily_rev below 50k?
    # QUESTION: instead of printing a warning, should we just throw an unhandled exception?
    def initialize(daily_rev, price, percent)
      @daily_rev = daily_rev
      @price     = price
      @percent   = percent
    end

    def per_day
      PurchaseResult.new(optimistic_bordering_on_fraudulent_daily_purchases)
    end

    # TODO: re-name this to laundered_mafia_money
    def optimistic_bordering_on_fraudulent_daily_purchases
      always_round_up(net_daily_rev/price)
    end

    def net_daily_rev
      daily_rev * floatify_percent(percent)
    end

    # TODO: Chris said this needs to be 64 bit precision
    def floatify_percent(percent)
      percent/100.0
    end

    # don't worry about the rounding errors
    # that's our business
    def always_round_up(amount)
      amount.to_i + 1
    end

    # kind of a moral grey-area always assuming every month is 31 days
    # but DateTime is like super hard so fuckit
    # plus, the backers really need to feel like we're not hemorrhaging money
    # especially the headpants sperg whales like dick wulf
    def per_month
      PurchaseResult.new(per_day.value * 31)
    end

    # TODO: raise NotEnoughMoneyException if purchases.per_year is lower than our burn rate
    # QUESTION: Do we know our burn-rate?
    # Maybe we should automate the ship sale process. if we catch a NotEnoughMoneyException,
    # spawn an automated limited ship sale with LTI?
    def per_year
      # ALWAYS ROUND UP!
      # EVEN WHEN YOU'VE ALREADY ROUNDED UP!!!!
      PurchaseResult.new((365 * per_day.value) + 1)
    end

  end
end