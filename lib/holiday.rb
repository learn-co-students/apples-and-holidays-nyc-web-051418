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

  holiday_supplies[:summer][:fourth_of_july][1]


end

def add_supply_to_winter_holidays(holiday_hash, supply)

  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply

end


def add_supply_to_memorial_day(holiday_hash, supply)

  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)

  holiday_hash[season][holiday_name] = supply_array

  holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season

  ar = []

  holiday_hash.each do |season, holiday|
    ar << holiday.values
  end

  ar.flatten

end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each do |season, holiday|

    puts "#{season.to_s.capitalize}:"

    holiday.each do |name, supplies|
      ar = name.to_s.split("_")
      i = 0
      len = ar.size
      while i < len
        ar[i].capitalize!
        i += 1
      end
      str = ar.join(" ")
      puts "  #{ar.join(" ")}: #{supplies.join(", ")}"
    end

  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  ar = []

  holiday_hash.each do |season, holiday|

    holiday.each do |name, supplies|
      if supplies.include?("BBQ")
        ar << name
      end
    end
  end

  ar

end
