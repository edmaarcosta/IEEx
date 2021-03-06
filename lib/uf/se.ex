defmodule IEEx.UF.SE do # 27123456-3
  alias IEEx.Util

  @peso [9, 8, 7, 6, 5, 4, 3, 2]

  def is_valid?(input) do
    ie = Util.only_numbers(input)

    if String.length(ie) == 9 do
      l_ie = Util.parse_ie(ie)
      # extra digito verificador
      [f_dig] = Util.get_digs(l_ie, 1)
      # remove o digito verificador
      rest_ie = List.delete_at(l_ie, -1)
      #
      resto =
        rest_ie
        |> Util.calc_peso(@peso)
        |> rem(11)

      dv = (11 - resto)
      dv = if (dv == 10 || dv == 11), do: 0, else: dv

      f_dig == dv
    end
  end
end
