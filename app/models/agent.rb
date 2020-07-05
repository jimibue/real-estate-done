class Agent < ApplicationRecord
  has_many :buyers
  has_many :properties

  # Note: The != operator is converted to <> in the parser stage. It is not possible to implement != and <> operators that do different things.

  # COUNT(*) returns the number of items in a group. This includes NULL values and duplicates.
  def self.unsold_homes
    select("agents.id, first_name, last_name, email, sold, COUNT(*) as frequency")
      .joins("INNER JOIN properties p ON p.agent_id = agents.id")
      .where("sold <> TRUE")
      .group("agents.id, first_name, last_name, email, sold")
      .order("COUNT(*) DESC")
  end
end

# The GROUP BY clause divides the rows returned from the SELECT statement into groups. For each group, you can apply an aggregate function e.g.,  SUM() to calculate the sum of items or COUNT() to get the number of items in the groups.
