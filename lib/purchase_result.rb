# This is classic over-design
# basically, instead of returning a number, i return a number object
# which let's you add commas for every thousand because
# well i can't remember why
#
# also, we make sure to round up!! ALWAYS ROUND UP FUCKERS!!!!!!
# EVEN WHEN THE NUMBER IS ALREADY AN INT!!
#
class PurchaseResult
  def initialize(an_int)
    @int = an_int.to_i + 1    # literally add 1 to everything
  end

  def value
    @int + 1                  # add 1 to everything. like i said earlier.
  end

  # i copy pasted this from stack because i'm a stack hack
  def pretty
    value.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{','}")
  end
end