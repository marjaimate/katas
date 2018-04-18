defmodule With do
  def example do
    with digits <- some_fun(),
         sum <- sum_fum()
    do
      # do other things
    end
  end
end
