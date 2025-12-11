program LinkedListShort;

{$MODE OBJFPC}

type
  PNode = ^TNode;
  TNode = record
    data: Integer;
    next: PNode;
  end;

  PLinkedList = ^TLinkedList;
  TLinkedList = record
    head: PNode;
  end;

function new_node(v: Integer): PNode;
var n: PNode;
begin
  New(n);
  n^.data := v;
  n^.next := nil;
  new_node := n;
end;

function new_list: PLinkedList;
var l: PLinkedList;
begin
  New(l);
  l^.head := nil;
  new_list := l;
end;

procedure append(l: PLinkedList; v: Integer);
var t: PNode;
begin
  if l^.head = nil then
    l^.head := new_node(v)
  else
  begin
    t := l^.head;
    while t^.next <> nil do t := t^.next;
    t^.next := new_node(v);
  end;
end;

procedure insert_after(n: PNode; v: Integer);
var t: PNode;
begin
  if n = nil then Exit;
  t := new_node(v);
  t^.next := n^.next;
  n^.next := t;
end;

procedure delete_value(l: PLinkedList; v: Integer);
var t, p: PNode;
begin
  if l^.head = nil then Exit;

  t := l^.head;

  if t^.data = v then
  begin
    l^.head := t^.next;
    Dispose(t);
    Exit;
  end;

  while (t <> nil) and (t^.data <> v) do
  begin
    p := t;
    t := t^.next;
  end;

  if t = nil then Exit;

  p^.next := t^.next;
  Dispose(t);
end;

procedure print_list(l: PLinkedList);
var t: PNode;
begin
  t := l^.head;
  Write('List: ');
  while t <> nil do
  begin
    Write(t^.data, ' -> ');
    t := t^.next;
  end;
  WriteLn('nil');
end;

var
  lst: PLinkedList;

begin
  lst := new_list;

  append(lst, 10);
  append(lst, 20);
  append(lst, 30);
  print_list(lst);

  insert_after(lst^.head, 15);
  print_list(lst);

  delete_value(lst, 20);
  print_list(lst);
end.
