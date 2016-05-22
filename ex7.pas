(*
Print the number of words starting with "В" and ending with "К".

XXX: I use "V" and "K" instead because I can't configure unicode support.
*)

type StringArray = array of String;

function words(s: String): StringArray;
var
  i, j, k: Integer;
  ws: StringArray;
  w: String;
begin
  j := 1;
  k := 0;
  w := '';
  for i := 1 to Length(s) do
    if (s[i] <> ' ')
    then
      begin
        SetLength(w, j+1);
        w[j] := s[i];
        j    := j + 1;
      end
    else
      if (w <> '')
      then
        begin
          SetLength(ws, k+1);
          ws[k] := w;
          k     := k + 1;
          j     := 1;
          SetLength(w, 0);
        end;
  (* Anything left? *)
  if (Length(w) > 0)
  then
    begin
      SetLength(ws, k+1);
      ws[k] := w;
      SetLength(w, 0);
    end;
  Result := ws;
end;

procedure printMatches(ws: StringArray);
var
  i: Integer;
  w: String;
begin
  for i := 0 to Length(ws)-1 do
    begin
      w := ws[i];
      if ((w[1] = 'V') and (w[Length(w)-1] = 'K'))
      then WriteLn(w);
    end;
end;

var s: String;
begin
  ReadLn(s);
  printMatches(words(s));
end.
