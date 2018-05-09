require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash.each do |season, holiday|
      holiday.each do |holiday, stuff|
            if holiday == :christmas || holiday == :new_years
                stuff << supply
            end
      end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
      holiday.each do |holiday, stuff|
            if holiday == :memorial_day
                stuff << supply
            end
      end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)


   holiday_hash[season][holiday_name] = supply_array
   holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)

  new_array = Array.new
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday, stuff|
              new_array << stuff
        end
      end
  end
  new_array.flatten!
end


def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  str = String.new
    holiday_hash.each do |season, holiday|
      str << "#{season.capitalize}:\n"
      holiday.each do |holiday, stuff|
          array_holiday_words = holiday.to_s.split("_")
          array_holiday_words.each do |holiday_word|
              holiday_word.capitalize!
          end
          str << "  #{array_holiday_words.join(" ")}: "
          str << "#{stuff.join(", ")}"
          str << "\n"

      end

    end

    puts str

end

def all_holidays_with_bbq(holiday_hash)
  new_array = Array.new
  holiday_hash.each do |season, holiday|
      holiday.each do |holiday, stuff|
         if stuff.include?("BBQ")
           new_array << holiday
        end
      end
  end
  new_array
end


holiday_hash =    {
     :winter => {
       :christmas => ["Lights", "Wreath"],
       :new_years => ["Party Hats"]
     },
     :summer => {
       :fourth_of_july => ["Fireworks", "BBQ"]
     },
     :fall => {
       :thanksgiving => ["Turkey"]
     },
     :spring => {
       :memorial_day => ["BBQ"]
     }
   }
all_holidays_with_bbq(holiday_hash)
