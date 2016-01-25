# this is classic over-design
# basically, instead of returning a number, i return a number object
# which let's you add commas for every thousand because
# well i can't remember why
#
# this was chris's idea.
# i tried to say no.
# but i now believe he literally doesn't understand that word
#
class PurchaseResult
  def initialize(an_int)
    @int = an_int.to_i + 1    # literally add 1 to everything, the numbers just work out better
  end

  def value
    @int + 1                  # add 1 to everything. like i said earlier.
  end

  # i copy pasted this from stack because i'm a stack whore
  def pretty
    value.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{','}")
  end
end