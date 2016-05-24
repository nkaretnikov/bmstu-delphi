(*
Use sets to write this program.  Given a string of lowercase words (separated by
spaces) ending with the exclamation mark, print all vowels in alphabetical
order that belong to every odd word and don't belong to any even ones.
*)

uses TypInfo;

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

type CharSet = Set of Char;

function f(ws: StringArray): StringArray; 
var
  i, j: Integer;
  res: StringArray;
  vowels: CharSet; 
  w: CharSet;
  tInfo: PTypeInfo;
  propName: String;
  propInfo: PPropInfo;

  // XXX
  c: Char;
  k: Integer; 
begin
  vowels := ['a', 'e', 'i', 'o', 'u'];
  j := 0;
  for i := 0 to Length(ws)-1 do
    begin
      (* I feel bad about this. *)
      tInfo := TypeInfo(String);
      propName := '';
      WriteLn('XXXXXXXXXXXXXXXXXX');
      propInfo := GetPropInfo(tInfo, propName);
      w := CharSet([StringToSet(propInfo, ws[i])]);


      k := 0;
      for c in w do
        begin
          Inc(k);
          WriteLn(c);
        end;

      (*
      if (Odd(i))
      then
      else  // even
      *)
    end;
  Result := res;
end;

var s: String;
begin
  Read(s);
  f(words(s));
end.
