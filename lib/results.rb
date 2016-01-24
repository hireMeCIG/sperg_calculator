module Sperg
  class Results
    attr_reader :min_monthly_rev, :daily_rev

    # note: attr_accessor lets you mutate the purchase_hash
    # so hey CIG, feel free to "tweak" these numbers to fit whatever
    # narrative you need to push more jpegs on retards
    attr_accessor :purchase_hash

    def initialize(daily_rev)
      @purchase_hash = Hash.new(0)
      @daily_rev = daily_rev
      @min_monthly_rev = 3e6        # always round up to 3M per month, guys
    end

    def add_result(purchases)
      purchase_hash[:per_day]   += purchases.per_day.value
      purchase_hash[:per_month] += purchases.per_month.value
      purchase_hash[:per_year]  += purchases.per_year.value
    end

    # Question: Should we always return at least 50,000 so that Chris doesn't throw
    # an autistic panic-tantrum?
    def per_day
      optimistic_return(purchase_hash[:per_day], daily_rev, min_daily_rev)
    end

    def per_month
      optimistic_return(purchase_hash[:per_month], (daily_rev * 31), min_monthly_rev)
    end

    def per_year
      optimistic_return(purchase_hash[:per_year], (daily_rev * 365), min_yearly_rev)
    end

    # Always think positive, guys!
    def optimistic_return(purchases, actual_revenue, happy_revenue)
      if actual_revenue < happy_revenue
        return PurchaseResult.new(optimisticify(purchases, actual_revenue, happy_revenue))
      else
        return PurchaseResult.new(purchases)
      end
    end

    def optimisticify(actual_purchases, actual_revenue, happy_revenue)
       rev_per_purchase = actual_revenue / actual_purchases
       revenue_optimism_factor = happy_revenue - actual_revenue      # don't worry. be happy. i learned that in hollywood.
       immersion = (revenue_optimism_factor / rev_per_purchase)      # losing money breaks my immersion
       actual_purchases + immersion + 1                              # PLUS ONE BITCHES!!!!
    end

    # always assume it's february. the numbers just work out better
    # not sure why
    def min_daily_rev
      ((min_monthly_rev / 28.0)).to_i + 1                   # don't forget to round up!!
    end

    def min_yearly_rev
      min_monthly_rev * 13                                  # it's a baker's dozen! lol
    end

  end
end