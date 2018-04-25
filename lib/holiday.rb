require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
 return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holiday|
    holiday.each do |attribute, items|
      if(season.to_s == "winter")
        items.push("Balloons")
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holiday|
    holiday.each do |attribute, items|
      if(attribute.to_s == "memorial_day")
        items.push(supply)
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash.each do |curr_season, curr_holiday|
    if curr_season == season
      holiday_hash[curr_season][holiday_name] = supply_array
    end
  end
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash.each do |season, holidays|
    if season.to_s == "winter"
      winter_supplies.push(holidays.values)
      winter_temp = winter_supplies[0][1] #party hats has a space in it, so join + split makes them two seperate elements
      winter_supplies = winter_supplies[0][0]
      winter_supplies = winter_supplies.push(winter_temp[0])
    end
  end
  winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season,holiday|
    puts "#{season.to_s.capitalize}:"
    holiday.each do |holiday_name, supplies|
      holiday_name_convert = holiday_name.to_s
      if holiday_name_convert.include?("_") #see if name contains underscores
        holiday_name_convert = holiday_name.to_s.downcase.tr!("_", " ") #convert underscores to spaces
        holiday_name_convert = holiday_name_convert.split #split into array
      end
      if holiday_name_convert.kind_of?(Array)
        holiday_name_convert.each do |dex|
          dex.capitalize!
        end
        holiday_name_convert = holiday_name_convert.join(" ") #rejoin array strings
      else
        holiday_name_convert.capitalize!
      end
      puts "  #{holiday_name_convert}: #{supplies.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  all_holidays_with_bbq = []
  holiday_hash.each do |season,holiday|
    holiday.each do |holiday_name,supplies|
      if supplies.include?("BBQ")
        all_holidays_with_bbq.push(holiday_name)
      end
    end
  end
  all_holidays_with_bbq
end
