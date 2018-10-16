class Address
  attr_reader :street, :postal_code, :city

  def initialize(street, postal_code, city)
    @street, @postal_code, @city = street, postal_code, city
  end

  def to_s
    "#{street}, #{postal_code} #{city}"
  end
end