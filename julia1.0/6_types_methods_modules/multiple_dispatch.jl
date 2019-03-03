abstract type Employee end

mutable struct Developer <: Employee
  name::String
  iq
  favorite_lang::String
end


# Default constructor
Developer(name, iq) = Developer(name, iq, "Java")

dev1 = Developer("Bob", 110)
dev2 = Developer("Will", 145, "Julia")


mutable struct Manager <: Employee
  name::String
  iq
  department::String
end

man1 = Manager("Julia", 120, "ICT")


# Concrete types CANNOT be subtyped: ERROR:
#mutable struct MobileDeveloper <: Developer
#  platform::String
#end


function cleverer(e::Employee, d::Developer)
  if e.iq <= d.iq println("The developer $(d.name) is cleverer!")
  else println("The employee $(e.name) is cleverer!")
  end
end


function cleverer(d1::Developer, d2::Developer)
  if d1.iq <= d2.iq println("The developer $(d2.name) is cleverer!")
  else println("The developer $(d1.name) is cleverer!")
  end
end


cleverer(man1, dev1)
cleverer(man1, dev2)
cleverer(dev1, dev2)
