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
  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  ##  virus_effects calls the predicted_death and spreed_of_spread methods
  ##  with the appropriate instance variables these methods require.
  ##  Instance variables are created for each instance of VirusPredictor that 
  ##  is created. 
  def virus_effects  #HINT: What is the SCOPE of instance variables?
    predicted_deaths(@population_density, @population, @state)
    speed_of_spread(@population_density, @state)
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
  def predicted_deaths(population_density, population, state)
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else 
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  end

  ##  Called by the virus_effects method, uses if statements to determine
  ##  what to assign to the speed var. This method is passed the state var,
  ##  but does not need it.
  def speed_of_spread(population_density, state) #in months
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else 
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
alaska.virus_effects