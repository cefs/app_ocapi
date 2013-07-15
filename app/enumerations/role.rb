class Role < EnumerateIt::Base
  associate_values :admin, :visitor
end
