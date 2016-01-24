module Sperg
  class Funds
    class << self

      # always think positive guys
      # have you read The Secret?
      def remaining
        return "PLENTY!"
      end

      # even if you're not sure, there's more than enough!!
      def happy_plenty
        "Plenty of cash left hahaha no seriously, nothing to worry about!"
      end

      # TODO: need to add procedurally generated messages
      def audit(auditor)
        if valid_auditor?(auditor)

          case auditor
            when "backer", "nobody important"; return everything_is_fine_by_jpeg_please
            when "investor"; return na_ganna_dat
            when "derek";    return fuck_you
            when "bird";     return "SQUAAAK!!!"
            when "the feds"; return panic
            else
              return happy_plenty
          end
        end
      end

      def valid_auditor?(auditor)
        case auditor
          when "karl"
            puts "You're not an auditor, Karl. JPEG store is --->"
            return false

          when "karl's dad"
            puts "Nice try, Karl. JPEG store is --->"
            return false

          when "person with pubes"
            puts "SHAVE YOUR FUCKING PUBES YOU HEATHEN!!!!!"
            return "gross"            # truthy

          else return "possibly"      # truthy
        end
      end

      def everything_is_fine_by_jpeg_please
        "PLENTY! Haha we have enough to make this game twice! LOOK!!! JPEG!! SPECIAL!! FOR YOUUU!!!"
      end

      def radio_silence
        ""
      end

      def na_ganna_dat
        "not gonna do it pal."
      end

      def fuck_you
        "FUCK YOU I WILL SUE YOU I SWAER TO GODD YOU FAAAACK!!! ORWIN GET HIM!!!!"
      end

      def panic
        # TODO: figure out wtf to do when this shit goes bust
      end

    end
  end
end