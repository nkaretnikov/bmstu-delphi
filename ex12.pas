(*
Create a text file 'F'.  Write every word from 'F' containing less than three
letters to a file 'G'.
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

var F, G: TextFile;
var str: String;
var i: Integer;
var ws: StringArray;
begin
  (* Open a file for writing. *)
  AssignFile(F, 'F.txt');
  ReWrite(F);
  (* Write to it. *)
  WriteLn(F, 'One morning, when Gregor Samsa woke from troubled dreams, he');
  WriteLn(F, 'found himself transformed in his bed into a horrible vermin.');
  (* Close it. *)
  CloseFile(F);

  (* Reopen for reading. *)
  Reset(F);

  (* Write the contents into 'G'. *)
  AssignFile(G, 'G.txt');
  ReWrite(G);
  while not Eof(F) do
    begin
      ReadLn(F, str);
      ws := words(str);
      for i := 0 to Length(ws)-1 do
        begin
          if (StrLen(PChar(ws[i])) < 3)
          then WriteLn(G, ws[i]);
        end;
    end;
  CloseFile(F);
  CloseFile(G);
end.
