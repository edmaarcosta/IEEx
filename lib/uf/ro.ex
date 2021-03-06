defmodule IEEx.UF.RO do
  alias IEEx.Util
  alias IEEx.UF.RO9
  alias IEEx.UF.RO14
  
  def is_valid?(input) do
    ie = Util.only_numbers(input)
    
    if String.length(ie) > 0 do
      case String.length(ie) do
        9  -> RO9.is_valid?(ie)
        14 -> RO14.is_valid?(ie)
        _  -> false
      end
    else
      false
    end
  end
end
