module Sperg

  class StandardCitizenException < RuntimeError
    def initialize
      super("CITIZEN! Something has gone horribly wrong! GET A REFUND!!!")
    end
  end

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

  # where are all these goddamn shotguns coming from?
  class ShotgunException < RuntimeError
    def initialize
      super("Fatal Error: A shotgun.")
    end
  end

  # holy shit you sucks
  class DerpException < RuntimeError
    def initialize(msg)
      super("DERP!!! " + msg)
    end
  end

end