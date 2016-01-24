module Sperg

  # holy shit this guy sucks
  class KarltimeError < RuntimeError
    def inizialize
      super("Karl, GO FUCK YOURSELF.")
    end
  end

  # holy shit sandi sucks
  class MatildaMeltdownException < RuntimeError
    def inizialize
      super("Matilda, please calm down. Look at this picture of the color blue. Please Matilda. Relax.")
    end
  end

  # holy shit you sucks
  class DerpException < RuntimeError
    def initialize(msg)
      super("DERP!!!" + msg)
    end
  end

end