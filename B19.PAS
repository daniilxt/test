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
          new(tmp);
          readln(f1,tmp^.num,c,tmp^.fam,c,tmp^.naim,tmp^.year,tmp^.price);
          uk:=head;

          while (uk^.next^.next <> nil) do
          begin
               if (uk^.next^.num > tmp^.num) then break;
               uk:=uk^.next;
          end;
          tmp^.next:=uk^.next;
          tmp^.pred:=uk;
          uk^.next^.pred:=tmp;
          uk^.next:=tmp;
     end;
     {dlya hvosta}
     uk:=head^.next;
     while uk^.next <> nil do
     begin
          uk:=uk^.next;
     end;
     uk:=uk^.pred;
     tail:=uk;
end;

procedure p2 (head:p_list);
var uk,tmp:p_list;
c:char;
begin
writeln('Input num, fam, naim, year, price');
     new(tmp);
     readln(tmp^.num,c,tmp^.fam,c,tmp^.naim,tmp^.year,tmp^.price);
     uk:=head;

     while(uk^.next^.next <> nil) do
     begin
          if(uk^.next^.num > tmp^.num) then break;
          uk:=uk^.next;
     end;
     tmp^.next:=uk^.next;
     tmp^.pred:=uk;
     uk^.next^.pred:=tmp;
     uk^.next:=tmp;
end;
procedure p3(head,tail:p_list; var f2:text);
var uk,tmp:p_list;
c:char;
begin
writeln('input author and naim');
writeln(f2,'Kniga avtora');
     new(tmp);
     readln(tmp^.fam,c,tmp^.naim);
     uk:=head;

     if tmp^.fam[1]<='k' then
     begin
       while uk^.next^.next <> nil do
       begin
               if (uk^.fam = tmp^.fam) and (uk^.naim =tmp^.naim) then
               begin
                    writeln(f2,uk^.num,' ',uk^.fam,' ',uk^.naim,' ',uk^.year,' ',uk^.price);
                    exit;
               end
               else uk:=uk^.next;
       end;
     end
     else
      if tmp^.fam[1] >='l' then
          uk:=tail;
          begin
               while uk^.pred <> nil do
               begin
                   if (uk^.fam = tmp^.fam) and (uk^.naim =tmp^.naim) then
                   begin
                        writeln(f2,uk^.num,' ',uk^.fam,' ',uk^.naim,' ',uk^.year,' ',uk^.price);
                        exit;
                   end
                   else uk:=uk^.pred;
               end;
          end;
end;
procedure p4(head,tail:p_list; var f2:text);
var uk,tmp:p_list;
begin
writeln(f2,'----');
     uk:=head^.next;
     while uk^.next <> nil do
     begin
          writeln(f2,uk^.num,' ',uk^.fam,' ',uk^.naim,' ',uk^.year,' ',uk^.price);
          uk:=uk^.next;
     end;
     writeln(f2,' ');
      uk:=uk^.pred;
      tail:=uk;
uk:=tail;
     while(uk^.pred <> nil) do
     begin
          writeln(f2,uk^.num,' ',uk^.fam,' ',uk^.naim,' ',uk^.year,' ',uk^.price);
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
p4(head1,tail1,f2t);
p2(head1);
p4(head1,tail1,f2t);
p3(head1,tail1,f2t);
p4(head1,tail1,f2t);
close(f1t);
close(f2t);
END.