(*
Inspect an array of 45 elements.  If after each positive element there is at
most two negative ones, return the initial array.  Otherwise, keep only the
negative elements preserving their order.
*)

uses Math;

type DoubleArray = array of Double;

function f(xs: DoubleArray): DoubleArray;
var
  ys: DoubleArray;
  i, j, negCount, negMax: Integer;
begin
  j        := 0;
  negCount := 0;
  negMax   := 0;
  for i := 0 to Length(xs)-1 do
    if (xs[i] < 0)
    then
      begin
        SetLength(ys, j+1);
        ys[j] := xs[i];
        j        := j + 1;
        negCount := negCount + 1;
      end
    else
      begin
        negMax := Max(negMax, negCount);
        negCount := 0;
      end;

  if (negMax > 2)
  then Result := ys
  else Result := xs
end;

function makeArray(xs: DoubleArray; len: Integer): DoubleArray;
var i: Integer;
begin
  SetLength(xs, len);
  for i := 0 to len-1 do
    xs[i] := i+1;
  Result := xs;
end;

procedure printArray(xs: DoubleArray);
var i, len: Integer;
begin
  len := Length(xs);
  for i := 0 to len-1 do
    if (i = len-1)
    then Write(xs[i]:4:2)
    else
      begin
        Write(xs[i]:4:2);
        Write(', ');
      end;
  WriteLn('');
end;

procedure printResults(xs: DoubleArray);
begin
  printArray(xs);
  printArray(f(xs));
end;

var arr1, arr2, arr3, arr4: DoubleArray;
begin
  // OK.
  arr1 := makeArray(arr1, 45);

  arr2 := makeArray(arr2, 45);
  arr2[17] := -1;
  arr2[18] := -7.9;
  arr2[20] := -3;


  // Invalid.
  arr3 := makeArray(arr3, 45);
  arr3[0] := -1;
  arr3[1] := -2;
  arr3[2] := -3;
  arr3[40] := -9000;
  arr3[42] := -7;

  arr4 := makeArray(arr4, 45);
  arr4[10] := -90;
  arr4[11] := -6.4;
  arr4[12] := -1111;


  printResults(arr1);
  WriteLn('');
  printResults(arr2);
  WriteLn('');
  printResults(arr3);
  WriteLn('');
  printResults(arr4);
end.
