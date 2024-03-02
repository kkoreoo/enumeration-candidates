# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require 'date'

def find(id)
   # Your code Here
  @candidates.each { |candidate|
    if id == candidate[:id]
      return candidate
    end
  } 
end
  
  def experienced?(candidate)
    # Your code Here
    candidate[:years_of_experience] >= 2
  end
  
  def qualified_candidates(candidates)
    # Your code Here
    qualified_candidates = candidates.filter do |candidate| 
      days_since_applied = (Date.today - Date.parse(candidate[:date_applied])).to_i
      experienced?(candidate) &&
      ['Ruby', 'Python'].include?(candidate[:languages]) &&
      days_since_applied <= 15 &&
      candidate[:age] >= 18
    end
  end
  
  # More methods will go below
  def ordered_by_qualifications(candidates)
    ordered_candidates = candidates.sort_by do |candidate| 
      [-candidate[:years_of_experience], -candidate[:github_points]]
    end
    ordered_candidates
  end
