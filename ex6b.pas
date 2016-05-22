(*
Given an S(n,n) matrix such that n<9, print the index of each row containing
more digits than letters.
*)

type CharArray    = array of Char;
type IntegerArray = array of Integer;

function isDigit(c: Char): Boolean;
var
  i: Integer;
  res: Boolean;
const arr: array[0..9] of Char = '0123456789';
begin
  res := False;
  for i := 0 to Length(arr)-1 do
    if (c = arr[i])
    then
      begin
        res := True;
        break;
      end;
  Result := res;
end;

procedure f(arr: array of CharArray);
var i, j, digits, letters: Integer;
begin
  for i := 0 to Length(arr)-1 do
    begin
      digits  := 0;
      letters := 0;
      for j := 0 to Length(arr[i])-1 do
        if (isDigit(arr[i,j]))
        then digits := digits + 1
        else letters := letters + 1;
      if (digits > letters)
      then WriteLn(i);
    end;
end;

var arr1: array of CharArray;
begin
  SetLength(arr1, 4);
  SetLength(arr1[0], 4);
  SetLength(arr1[1], 4);
  SetLength(arr1[2], 4);
  SetLength(arr1[3], 4);

  arr1[0,0] := 'a';
  arr1[0,1] := 'b';
  arr1[0,2] := 'c';
  arr1[0,3] := 'd';

  arr1[1,0] := 'e';
  arr1[1,1] := '2';
  arr1[1,2] := 'g';
  arr1[1,3] := '4';

  arr1[2,0] := '1';
  arr1[2,1] := 'j';
  arr1[2,2] := '3';
  arr1[2,3] := '4';

  arr1[3,0] := '1';
  arr1[3,1] := '2';
  arr1[3,2] := 'o';
  arr1[3,3] := '4';

  f(arr1);
end.
