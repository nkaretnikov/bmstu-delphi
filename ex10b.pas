(*
Compute the arithmetic mean of the difference between two matrices using
untyped parameters.  Test it on two matrices with random numbers.

XXX: This solution doesn't use untyped parameters because I couldn't make it
work with FPC.
*)

{$ASSERTIONS ON}

type Matrix = array of array of Real;

function matRows(mat: Matrix): Integer;
begin
  Result := Length(mat);
end;

function matCols(mat: Matrix): Integer;
begin
  Assert(matRows(mat) > 0);
  Result := Length(mat[0]);
end;

function matInit(mat: Matrix; rows, cols: Integer): Matrix;
var irow: Integer;
begin
  Assert(rows > 0);
  Assert(cols > 0);

  SetLength(mat,rows);
  for irow := 0 to (rows-1) do
    SetLength(mat[irow],cols);
  Result := mat;
end;

function matSum(mat: Matrix): Real;
var irow, icol: Integer;
var rows, cols: Integer;
var res: Real;
begin
  res := 0;
  rows := matRows(mat);
  cols := matCols(mat);
  for irow := 0 to (rows-1) do
    for icol := 0 to (cols-1) do
      res := res + mat[irow,icol];
  Result := res;
end;

function matLength(mat: Matrix): Real;
begin
  Result := matRows(mat) * matCols(mat);
end;

function matMean(mat: Matrix): Real;
begin
  Result := matSum(mat) / matLength(mat);
end;

function matSub(x, y: Matrix): Matrix;
var irow, icol: Integer;
var rows, cols: Integer;
var res: Matrix;
begin
  Assert(matRows(x) = matRows(y));
  Assert(matCols(x) = matCols(y));
  rows := matRows(x);
  cols := matCols(x);

  res := matInit(res, rows, cols);

  for irow := 0 to (rows-1) do
    for icol := 0 to (cols-1) do
      res[irow,icol] := x[irow,icol] - y[irow,icol];

  Result := res;
end;

procedure matPrint(mat: Matrix);
var irow, icol: Integer;
var rows, cols: Integer;
begin
  rows := matRows(mat);
  cols := matCols(mat);

  for irow := 0 to (rows-1) do
    for icol := 0 to (cols-1) do
      begin
        Write(mat[irow,icol]:4:2);
        if (icol <> (cols-1))
        then Write(', ')
        else WriteLn('');
      end;
end;

var x, y: Matrix;
var irow, icol: Integer;
var rows, cols: Integer;
var i: Integer;
begin
  rows := 5;
  cols := 4;

  x := matInit(x, rows, cols);
  y := matInit(y, rows, cols);

  i := 0;
  for irow := 0 to (rows-1) do
    for icol := 0 to (cols-1) do
      begin
        x[irow,icol] := i;
        i := i + 1;
        y[irow,icol] := i;
      end;

  WriteLn('x:');
  matPrint(x);
  WriteLn('');

  WriteLn('y:');
  matPrint(y);
  WriteLn('');

  WriteLn('y - x:');
  matPrint(matSub(y, x));
  WriteLn('');

  WriteLn('mean(y - x):');
  WriteLn(matMean(matSub(y, x)):4:2);
end.
