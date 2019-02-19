uses crt;
TYPE
p_list =^zap;
zap = RECORD
    num:integer;
    fam:string[6];
    naim:string[6];
    year:integer;
    price:integer;
next:p_list;
pred:p_list;
end;

procedure p1(var head,tail:p_list; var f1:text);
var uk,tmp:p_list;
c:char;
begin
     new(head);
     new(head^.next);
     head^.pred:=nil;
     head^.next^.next:=nil;
     uk:=head;
     while not eof (f1) do
     begin
          new(uk^.next);
          uk^.next^.pred:=uk;
          uk:=uk^.next;
          readln(f1,uk^.num,c,uk^.fam,c,uk^.naim,uk^.year,uk^.price);
          uk^.next:=nil;
     end;
     new(uk^.next);
     uk^.next^.pred:=uk;
     uk:=uk^.next;
     uk^.next:=nil;
     tail:=uk;
     uk:=head^.next;

     while uk^.next <> nil do
     begin
          writeln(uk^.num,' ',uk^.fam,' ',uk^.naim,' ',uk^.year,' ',uk^.price);
          uk:=uk^.next;
     end;
     writeln;
     tail:=tail^.pred;
     uk:=tail;
     while(uk^.pred <> nil) do
     begin
          writeln(uk^.num,' ',uk^.fam,' ',uk^.naim,' ',uk^.year,' ',uk^.price);
          uk:=uk^.pred;
     end;
end;

VAR
head1,tail1:p_list;
f1t,f2t:text;
BEGIN
clrscr;
assign(f1t,'in19.txt');
reset(f1t);
assign(f2t,'out19.txt');
rewrite(f2t);
p1(head1,tail1,f1t);
close(f1t);
close(f2t);
END.