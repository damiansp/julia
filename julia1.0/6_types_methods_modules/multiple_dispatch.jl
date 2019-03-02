abstract type Employee end

mutable struct Developer <: Employee
  name::String
  iq
  favorite_lang::String
end

# Default constructor
Developer(name, iq) = Developer(name, iq, "Java")
