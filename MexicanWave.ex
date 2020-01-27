defmodule MexicanWave do
  def waveUp([firstChars | remainingChars], fullname, mexicanWave, charCount) do
    {sChars, eChars} = fullname |> String.split_at(charCount + 1)
    {first_block, second_block} = sChars |> String.split_at(-1)
    mexicanString = first_block <> (second_block |> String.upcase()) <> eChars

    mexicanWave =
      cond do
        firstChars !== " " -> mexicanWave ++ [mexicanString]
        firstChars == " " -> mexicanWave
      end

    charCount = charCount + 1
    waveUp(remainingChars, fullname, mexicanWave, charCount)
  end

  def waveUp([], _fullname, mexicanWave, _charCount) do
    mexicanWave
  end

  def wave(name) do
    waveUp(name |> String.split("", trim: true), name, [], 0)
  end
end

IO.puts(MexicanWave.wave("a       b    "))
