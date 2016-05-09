// Given a sequence of numbers, construct a natural number having its digits in
// reverse order.

uses SysUtils;

type IntegerArray = array of Integer;

function makeInteger(xs: IntegerArray): Integer;
var i, n, m: Integer;
begin
  n := 0;
  m := 1;
  for i := 0 to Length(xs) - 1 do
    begin
      n := n + xs[i] * m;
      m := m * 10;
    end;
  Result := n;
end;

function readArray(xs: IntegerArray): IntegerArray;
var
  i: Integer;
  s: String;
begin
  i := 0;
  while True do
    begin
      Readln(s);
      if (s = 'done')
      then break
      else
        begin
          SetLength(xs, i+1);
          xs[i] := StrToInt(s);
          i := i+1;
        end;
    end;
  Result := xs;
end;

var
  n: Integer;
  xs: IntegerArray;
begin
  Writeln('Enter some natural numbers (''done'' to stop):');
  xs := readArray(xs);
  n := makeInteger(xs);
  writeln(n);
end.
