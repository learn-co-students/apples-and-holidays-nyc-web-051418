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
    # Write a method that adds a supply to all Winter holidays
  # describe "#add_supply_to_winter_holidays" do
  #   it "iterates through winter holidays adds a supply to each one" do
  #     add_supply_to_winter_holidays(holiday_supplies, "Balloons")
  #     expect(holiday_supplies[:winter][:christmas]).to include("Balloons")
  #     expect(holiday_supplies[:winter][:new_years]).to include("Balloons")
  #   end
  holiday_hash[:winter].each do |key, value|
    value << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day][1] = supply 
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  
  holiday_hash[season] = {
    holiday_name => supply_array
  }
  
  return holiday_hash 
  
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
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
    puts "#{season.capitalize}:"
  
    holiday.each do |key,value|
      holiday = key.to_s.split("_").map(&:capitalize).join(' ')
      puts "  #{holiday}: #{value.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  answer = []
  holiday_hash.each do |season,holiday|
    holiday.each do |key,value|
      value.each do |x|
        if x == "BBQ"
          answer << key
        end
      end
    end
  end
  return answer

end







