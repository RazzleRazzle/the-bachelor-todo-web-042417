require 'pry'

def get_first_name_of_season_winner(data, season)
  winner = nil
  data.each do |key, value|
    if key == season
      value.each do |attribute, att_info|
        if attribute["status"] == "Winner"
          winner = attribute["name"]
        end
      end
    end
  end
  winner.split.first
end

def get_contestant_name(data, occupation)
  occupant = nil
  data.each do |key, value|
    value.each do |attribute, att_info|
      if attribute["occupation"] == occupation
        occupant = attribute["name"]
      end
    end
  end
  occupant
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |key, value|
    value.each do |attribute, att_info|
      if attribute["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  occupant = nil
  data.each do |key, value|
    value.find do |attribute, att_info|
      if attribute["hometown"] == hometown
        occupant = attribute["occupation"]
      end
    end
  end
   occupant
end



def get_average_age_for_season(data, season)
  ages = []

  data.each do |key, value|
    if key == season
      value.each do |attribute, att_info|
        ages << attribute["age"]
      end
    end
  end

  int_ages = ages.collect(&:to_i)

  average = int_ages.inject{ |sum, el| sum + el }.to_f / int_ages.size

  average.round
end
