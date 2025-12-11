program DynamicArraySimple;

type
  TDynamicArray = record
    data: array of Integer;
    size: Integer;
    capacity: Integer;
  end;
  PDynamicArray = ^TDynamicArray;

// Create array
function CreateArray(cap: Integer): PDynamicArray;
var
  arr: PDynamicArray;
begin
  New(arr);
  SetLength(arr^.data, cap);
  arr^.size := 0;
  arr^.capacity := cap;
  CreateArray := arr;
end;

// Resize array (double capacity)
procedure Resize(arr: PDynamicArray);
begin
  arr^.capacity := arr^.capacity * 2;
  SetLength(arr^.data, arr^.capacity);
end;

// Append value
procedure Append(arr: PDynamicArray; value: Integer);
begin
  if arr^.size = arr^.capacity then
    Resize(arr);

  arr^.data[arr^.size] := value;
  arr^.size := arr^.size + 1;
end;

// Insert value at position
procedure InsertAt(arr: PDynamicArray; pos, value: Integer);
var
  i: Integer;
begin
  if arr^.size = arr^.capacity then
    Resize(arr);

  for i := arr^.size downto pos + 1 do
    arr^.data[i] := arr^.data[i - 1];

  arr^.data[pos] := value;
  arr^.size := arr^.size + 1;
end;

// Delete value at position
procedure DeleteAt(arr: PDynamicArray; pos: Integer);
var
  i: Integer;
begin
  for i := pos to arr^.size - 2 do
    arr^.data[i] := arr^.data[i + 1];

  arr^.size := arr^.size - 1;
end;

// Print array
procedure PrintArray(arr: PDynamicArray);
var
  i: Integer;
begin
  Write('Array: ');
  for i := 0 to arr^.size - 1 do
    Write(arr^.data[i], ' ');
  Writeln;
end;

// Free memory
procedure FreeArray(arr: PDynamicArray);
begin
  SetLength(arr^.data, 0);
  Dispose(arr);
end;

var
  A: PDynamicArray;

begin
  A := CreateArray(2);

  Append(A, 10);
  Append(A, 20);
  Append(A, 30);     // triggers resize
  PrintArray(A);

  InsertAt(A, 1, 99);
  PrintArray(A);

  DeleteAt(A, 0);
  PrintArray(A);

  FreeArray(A);
end.
