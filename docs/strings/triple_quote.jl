# first \n after """ is stripped
str = """
Hello,
world.
.
.
.
"""

s2 = """     This
     is
       a test"""
# also strips successive indentations
s3 = """
  Yet
  another
  test"""
print(str)
print(s2)
println()
print(s3)



# regex STOP
