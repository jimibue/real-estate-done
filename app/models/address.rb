class Address < ApplicationRecord
  belongs_to :property
  # The SELECT DISTINCT statement is used to return only distinct (different) values.
  # Determine which cities have the highest selling homes
  # Concatenates the values of string expressions and places separator values between them. The separator is not added at the end of string.

  # The CAST() function converts a value (of any type) into a specified datatype.

  # The COUNT() function returns the number of rows that matches a specified criteria.

  def self.cost_by_city
    select("DISTINCT city,
            STRING_AGG(CAST(price AS VARCHAR), ', ' ORDER BY price DESC) AS prices,
            COUNT(*) price")
      .joins("INNER JOIN properties p ON addresses.property_id = p.id")
      .where("p.sold IS TRUE")
      .group("city")
  end
end
