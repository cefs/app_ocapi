class Status < EnumerateIt::Base
  associate_values :approved, :pending, :closed
end
