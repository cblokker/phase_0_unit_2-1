# U2.W5: Virus Predictor

# I worked on this challenge [by myself, with: ].

# EXPLANATION OF require_relative
###   require_relative is how you include code or data from other
###   files. You only use the filename without the extension. Also,
###   if the file is not in the same directory as your code, you need
###   to include the path to the included file relative to your code file.
###

require_relative 'state_data'

class VirusPredictor

  ##  Takes the input parameters and assigns them to instance variables so they 
  ##  can be used by the various class methods.
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @pop = population
    @pop_density = population_density
    self.virus_effects
  end

  ##  virus_effects calls the predicted_death and spreed_of_spread methods
  ##  with the appropriate instance variables these methods require.
  ##  Instance variables are created for each instance of VirusPredictor that 
  ##  is created. 
  def virus_effects  #HINT: What is the SCOPE of instance variables?
    puts "#{@state} will loose #{predicted_deaths()} in this outbreak and will spread across the state in #{speed_of_spread} months.\n\n"
  end

  ##  the following methods cannot be called from outside the VirusPredictor class.
  ##  In this case, only the virus_effects method can call them. If we moved it a
  private  #what is this?  what happens if it were cut and pasted above the virus_effects method

  ##  This is the method doing all the work. It's called by the virus_effects method,
  ##  and gets it's parameter data from it as well. It uses if statements to evaluate
  ##  which calculation to run. The floor method returns the largest whole number
  ##  that is less than or equal to the float value. In other words, it always 
  ##  rounds down no matter the size of the fractional portion of the value.
  ##  predicted_deaths also returns the first half of the return statements, which
  ##  is why is uses the print method, so it won't have a newline. The speed_of_spread
  ##  method will return the 2nd half of the return statement, inline with this print.
  def predicted_deaths()
    return case
      when @pop_density >= 200 then (@pop * 0.4).floor
      when @pop_density >= 150 then (@pop * 0.3).floor
      when @pop_density >= 100 then (@pop * 0.2).floor
      when @pop_density >=  50 then (@pop * 0.1).floor
      else (@pop * 0.05).floor
    end
  end

  ##  Called by the virus_effects method, uses if statements to determine
  ##  what to assign to the speed var. This method is passed the state var,
  ##  but does not need it.
  def speed_of_spread() #in months
    return case
      when @pop_density >= 200 then 0.5
      when @pop_density >= 150 then 1.0
      when @pop_density >= 100 then 1.5
      when @pop_density >=  50 then 2.0
      when @pop_density <   50 then 2.5
    end
  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

##  By using #each_key, I was able to convert the manual entry of info 
##  to a loop that will in turn input each element from the STATE_DATA
##  array.
STATE_DATA.each_key { |name| VirusPredictor.new(name,
  STATE_DATA[name][:population_density],
  STATE_DATA[name][:population])
}
puts "-_-_-_-_-_--_-_-_-_-_--_-_-_-_-_--_-_-_-_-_--_-_-_-_-_--_-_-_--_-_-_-_-_--_-_-_-_-_--_-_-_-_-_--_-_-_-_-_-"
