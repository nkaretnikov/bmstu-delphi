(*
Design and define a class hierarchy, using composition, and test it.  The first
object is a real number with a floating point.  Its parameters are its value and
format.  Its methods are the constructor and a function, which determines the
number of digits after the floating point.  The second object is a set of
numbers.  Determine the average of the said numbers and the average number of
digits in the fractional part of each number.
*)

uses Math, SysUtils;

type FDigits = class(TObject)
  function fracDigits(): Real; virtual; abstract;
end;

type Float = class(FDigits)
  significand: Cardinal;
  // base: Cardinal; // base = 10;
  exponent: Integer;
  value: Real;
  constructor Create(significand: Cardinal; exponent: Integer);
  function fracDigits(): Real; override;
end;

constructor Float.Create(significand: Cardinal; exponent: Integer);
begin
  self.significand := significand;
  self.exponent := exponent;
  self.value := significand * Power(10, exponent);
end;

function Float.fracDigits(): Real;
begin
  if (exponent > 0)
  then Result := 0
  else Result := Abs(exponent)
end;

type FloatArray = array of Float;

type FloatSet = class(FDigits)
  values: FloatArray;
  function average(): Real;
  function fracDigits(): Real; override;
end;

function FloatSet.average(): Real;
var sum: Real;
var len: Integer;
var i: Integer;
begin
  len := Length(values);
  sum := 0;
  for i := 0 to len-1 do
    sum := sum + values[i].value;
  Result := sum / len;
end;

function FloatSet.fracDigits(): Real;
var sum: Real;
var len: Integer;
var i: Integer;
begin
  len := Length(values);
  sum := 0;
  for i := 0 to len-1 do
    sum := sum + values[i].fracDigits();
  Result := sum / len;
end;

var f,g,h: Float;
var fset: FloatSet;
begin
  f := Float.Create(421234, -4);
  WriteLn('f value: ', f.value:4:4);
  WriteLn('frac digits: ', f.fracDigits():4:2);

  g := Float.Create(9, 0);
  h := Float.Create(112, -2);

  fset := FloatSet.Create();
  SetLength(fset.values, 3);
  fset.values[0] := f;
  fset.values[1] := g;
  fset.values[2] := h;
  WriteLn('fset average: ', fset.average():4:2);
  WriteLn('fset average frac digits: ', fset.fracDigits():4:2);

  fset.Destroy();
  f.Destroy();
  g.Destroy();
  h.Destroy();
end.
