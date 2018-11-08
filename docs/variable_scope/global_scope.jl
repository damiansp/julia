module A
  a = 1
end



module B
  module C
    c = 2
  end

  b = C.c
  import ..A
  d = A.a
end



module D
  #b = a # err
end



module E
  import ..A
  #A.a = 2 # err
end
