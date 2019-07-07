Program Compiler;

Uses crt;

Var
t : text;
s : Char;
i,z,c_block : integer;
token,Ttoken,masukan,hasil,temp2 : String;
stack,temp : array [1..1000] of string;

procedure input;
begin
     read(t,s);
end;

procedure output;
begin
     writeln(token:35,' = ',Ttoken);
end;

procedure scan;
begin
     clrscr;
     gotoxy(30,1);writeln('==========PROSES SCAN==========');
     assign(t,'E:\Data\Diki\Kuliah\Semester 6\TK\Tugas besar\scanner\input.txt');
     reset(t);
     i := 1;
     while not eof(t) do
     begin
           input;
           if (s in['A'..'Z','a'..'z']) then
           begin
                repeat
                begin
                     token := token + s;
                     input;

                     if token = 'program' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'begin' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'end' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'integer' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'real' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'char' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'string' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'type' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'const' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'var' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'function' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'procedure' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'array' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'record' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'if' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'case' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'repeat' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'while' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'for' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'else' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'until' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'of' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'do' then
                     begin
                        if token+s ='dow' then
                        begin
                             repeat
                                   token := token + s;
                                   input;
                             until token = 'downto';
                             Ttoken := 'Keyword '+token;
                             break;
                        end
                        else
                        begin
                             Ttoken := 'Keyword '+token;
                             break;
                        end;
                     end
                     else if token = 'to' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'then' then
                     begin
                        Ttoken := 'Keyword '+token;
                        break;
                     end
                     else if token = 'and' then
                     begin
                        Ttoken := 'Operator '+token;
                        break;
                     end
                     else if token = 'or' then
                     begin
                        Ttoken := 'Operator '+token;
                        break;
                     end
                     else if token = 'not' then
                     begin
                        Ttoken := 'Operator '+token;
                        break;
                     end
                     else if token = 'div' then
                     begin
                        Ttoken := 'Operator '+token;
                        break;
                     end
                     else if token = 'mod' then
                     begin
                        Ttoken := 'Operator '+token;
                        break;
                     end
                     else
                         Ttoken := 'Identifier';
                end;
                until (not(s in['A'..'Z','a'..'z','_','0'..'9']));
                
                stack[i] := token;
                i := i+1;
                output;
                token := '';
           end;

           if (s = chr(39)) then
              begin
                   token := token + s;
                   input;
                   if (s in ['0'..'9','A'..'Z','a'..'z',chr(39)]) then
                   begin
                        token := token + s;
                        repeat
                        input;
                        token := token + s;
                        
                        until (s = chr(39));
                   end;
                   Ttoken := 'TYPESTRING';
                   stack[i] := token;
                   i := i+1;
                   output;
                   token := '';
              end;

           if (s in['0'..'9']) then
           begin
                repeat
                begin
                     token := token + s;
                     input;
                end;
                until (not(s in['0'..'9']));

                if (s = '.') then
                     begin
                          temp2 := token+s;
                          input;
                          if not(s = '.') then
                          begin
                               token := temp2;
                               repeat
                               begin
                                    token := token + s;
                                    input;
                               end;
                               until (not(s in['0'..'9']));
                          
                               Ttoken := 'TYPEREAL';
                               stack[i] := token;
                               i := i+1;
                               output;
                               token := '';
                          end
                          else
                          begin
                               Ttoken := 'TYPEINT';
                               stack[i] := token;
                               i := i+1;
                               output;
                               token := '';

                               Ttoken := 'Operator .';
                               token := s;
                               stack[i] := token;
                               i := i+1;
                               output;
                               token := '';
                          end;
                     end
                else
                begin
                Ttoken := 'TYPEINT';
                stack[i] := token;
                i := i+1;
                output;
                token := '';
                end;
           end;



           if (s in [':','=','<','>']) then
           begin
                token := token + s;

                if token = '=' then
                   begin
                        input;
                        if token+s = '==' then
                           begin
                                token := token + s;
                                Ttoken := 'Operator '+token;
                           end
                        else
                        Ttoken := 'Operator '+token;
                   end
                else if token = '<' then
                   begin
                        input;
                        if token+s = '<>' then
                           begin
                                token := token + s;
                                Ttoken := 'Operator '+token;
                           end
                        else if token+s = '<=' then
                           begin
                                token := token + s;
                                Ttoken := 'Operator '+token;
                           end
                        else
                        Ttoken := 'Operator '+token;
                   end
                else if token = '>' then
                   begin
                        input;
                        if token+s = '>=' then
                           begin
                                token := token + s;
                                Ttoken := 'Operator '+token;
                           end
                        else
                        Ttoken := 'Operator '+token;
                   end
                else if token = ':' then
                   begin
                        input;
                        if token+s = ':=' then
                           begin
                                token := token + s;
                                Ttoken := 'Operator '+token;
                           end
                        else
                        Ttoken := 'Operator '+token;
                   end;
                
                stack[i] := token;
                i := i+1;
                output;
                token := '';
           end;

           if (s in[';','.','(',')','[',']','^',',','+','-','/','*']) then
           begin
                token := s;

                if token = ';' then
                   Ttoken := 'Operator '+token
                else if token = '.' then
                   Ttoken := 'Operator '+token
                else if token = '(' then
                   Ttoken := 'Operator '+token
                else if token = ')' then
                   Ttoken := 'Operator '+token
                else if token = '[' then
                   Ttoken := 'Operator '+token
                else if token = ']' then
                   Ttoken := 'Operator '+token
                else if token = '^' then
                   Ttoken := 'Operator '+token
                else if token = ',' then
                   Ttoken := 'Operator '+token
                else if token = '+' then
                   Ttoken := 'Operator '+token
                else if token = '-' then
                   Ttoken := 'Operator '+token
                else if token = '/' then
                   Ttoken := 'Operator '+token
                else if token = '*' then
                   Ttoken := 'Operator '+token;

                
                stack[i] := token;
                i := i+1;
                output;
                token := '';
           end;


     end;
     close(t);
end;


procedure cek(terminal : string);

var
   p : integer;
   temp,temp3 : string;
begin
     c_block := 0;
     if (terminal[1] in ['a'..'z','A'..'Z','0'..'9',chr(39),'_']) and (length(terminal) = 1) or (temp2 = '.') then
     begin
          temp := masukan[z];
          write(temp);

          if z >= length(masukan) then
          begin
               i := i + 1;
               masukan := stack[i];
          end;
     end
     else
     begin
          masukan := stack[i];
          if terminal = masukan then
          begin
               if stack[i+2] = '[' then
               begin
                    temp3 := stack[i+3];
                    if not(temp3 = '.') then
                       begin
                            p := 1;
                            repeat
                                  p := p+1;
                                  temp3 := stack[i+p+2];
                            until temp3 = ']';
                            p := p+1;
                            c_block := p;
                            p := 0;
                       end;
               end;
               writeln(masukan);
               i := i + 1;
               masukan := stack[i];

          end
          else if not(terminal = masukan) then
          begin
               writeln('ERROR : ',masukan,' dan ',terminal,' tidak sesuai');
               delay(65535);halt;
          end;
     end;


end;

procedure p_type; Forward;
procedure block; Forward;
procedure expression; Forward; 
procedure variable; Forward; 
procedure statement; Forward;

procedure letter;
begin
     case(masukan[z])of
     'A' : cek('A');
     'B' : cek('B');
     'C' : cek('C');
     'D' : cek('D');
     'E' : cek('E');
     'F' : cek('F');
     'G' : cek('G');
     'H' : cek('H');
     'I' : cek('I');
     'J' : cek('J');
     'K' : cek('K');
     'L' : cek('L');
     'M' : cek('M');
     'N' : cek('N');
     'O' : cek('O');
     'P' : cek('P');
     'Q' : cek('Q');
     'R' : cek('R');
     'S' : cek('S');
     'T' : cek('T');
     'U' : cek('U');
     'V' : cek('V');
     'W' : cek('W');
     'X' : cek('X');
     'Y' : cek('Y');
     'Z' : cek('Z');
     'a' : cek('a');
     'b' : cek('b');
     'c' : cek('c');
     'd' : cek('d');
     'e' : cek('e');
     'f' : cek('f');
     'g' : cek('g');
     'h' : cek('h');
     'i' : cek('i');
     'j' : cek('j');
     'k' : cek('k');
     'l' : cek('l');
     'm' : cek('m');
     'n' : cek('n');
     'o' : cek('o');
     'p' : cek('p');
     'q' : cek('q');
     'r' : cek('r');
     's' : cek('s');
     't' : cek('t');
     'u' : cek('u');
     'v' : cek('v');
     'w' : cek('w');
     'x' : cek('x');
     'y' : cek('y');
     'z' : cek('z');
     end;
     
     {if z > length(masukan) then
        writeln('LETTER');       }
end;

procedure digit;

begin
     case(masukan[z])of
     '0' : cek('0');
     '1' : cek('1');
     '2' : cek('2');
     '3' : cek('3');
     '4' : cek('4');
     '5' : cek('5');
     '6' : cek('6');
     '7' : cek('7');
     '8' : cek('8');
     '9' : cek('9');
     end;
  {   if z > length(masukan) then
        writeln('DIGIT');           }
end;

procedure sign;
begin
     case (masukan[1]) of
     '+' : cek('+');
     '-' : cek('-');
     end;
end;

procedure identifier;
begin
     if masukan[1] in ['0'..'9'] then
     begin
          writeln('ERROR');
          delay(4000);halt;
     end;
     z := 1;
     repeat
           if masukan[z] in ['0'..'9'] then
              digit
           else if masukan[z] in ['a'..'z','A'..'Z','_'] then
               letter;
               if masukan[z] = '_' then
                  cek('_');
           z:=z+1;
     until z > length(masukan);
end;

procedure relationalOp;
begin
     if masukan = 'in' then
        cek('in')
     else if masukan = '=' then
        cek('=')
     else if masukan = '>' then
        cek('>')
     else if masukan = '>=' then
        cek('>=')
     else if masukan = '<>' then
        cek('<>')
     else if masukan = '<' then
        cek('<')
     else if masukan = '<=' then
        cek('<=');
end;

procedure p_string;
var
q : integer;
begin
     z := 1;
     cek(chr(39));
     z := z+1;
     repeat
           letter;
           if masukan[z] = chr(39) then
              cek(chr(39));
           z := z + 1;
     until z > length(masukan);
end;

procedure number;
begin
     z := 1;
     repeat
           digit;
           if (masukan[z] = '.') and not(stack[i+1] = '.') then
              begin
                   temp2 := '.';
                   cek('.');
              end;
           z := z+1;
     until z > length(masukan);
     temp2 := '';
end;

procedure constant;
begin
     if masukan[1] in ['0'..'9'] then
        number
     else if masukan[1] in [chr(39)] then
        p_string
     else
     begin
         writeln('ERROR');
         delay(4000);halt;
     end;

end;

procedure unsignedconst;
begin
     if masukan[1] in ['0'..'9'] then
        number
     else if masukan[1] = chr(39) then
        p_string
     else
     begin
          identifier;
     end
end;

procedure constDef;
begin
     identifier;
     writeln;cek('=');
     constant;
end;

procedure constDefPart;
begin
     if masukan = 'const' then
     begin
          cek('const');
          constDef;
          writeln;cek(';');
          if not((masukan = 'var') or (masukan = 'procedure') or (masukan = 'function') or (masukan = 'begin')) then
          begin
               repeat
                     constDef;
                     writeln;cek(';');
               until (masukan = 'var') or (masukan = 'procedure') or (masukan = 'function') or (masukan = 'begin');
          end;
     end;
end;

procedure scalarType;
begin
     cek('(');
     identifier;
     while not(masukan = ')') do
     begin
           writeln;cek(',');
           identifier;
     end;
     writeln;cek(')');
end;

procedure subrangeType;
begin
     z := 1;
     constant;
     writeln;cek('.');
     cek('.');
     constant;
end;

procedure simpleType;
begin
     if masukan = '(' then
         scalarType
     else if masukan[1] in ['a'..'z','A'..'Z'] then
         identifier
     else
         subrangeType;
end;

procedure arrayType;
begin
     cek('array');
     cek('[');
     simpleType;
     while not(masukan = ']') do
     begin
           cek(',');
           simpleType;
     end;
     writeln;cek(']');
     cek('of');
     p_type;
end;

procedure recordSection;
begin
     identifier;
     while not(masukan = ':') do
     begin
           writeln;cek(',');
           identifier;
     end;
     writeln;cek(':');
     p_type;
end;

procedure fieldList;
begin
     recordSection;
     writeln;cek(';');
     while not(masukan = 'end') do
     begin
          recordSection;
          writeln;cek(';');
     end;
end;

procedure recordType;
begin
     cek('record');
     fieldList;
     writeln;cek('end');
end;

procedure structuredType;
begin
     if masukan = 'array' then
        arrayType
     else
         recordType;
end;

procedure p_type;
begin
     if (masukan = 'array') or (masukan = 'record') then
        structuredType
     else
         simpleType;
end;

procedure typeDef;
begin
     identifier;
     writeln;cek('=');
     p_type;
end;

procedure typeDefPart;
begin
     if masukan = 'type' then
     begin
          cek('type');
          typeDef;
          writeln;cek(';');
          if not((masukan = 'const') or (masukan = 'var') or (masukan = 'procedure') or (masukan = 'function') or (masukan = 'begin')) then
          begin
               repeat
                     typeDef;
                     writeln;cek(';');
               until (masukan = 'const') or (masukan = 'var') or (masukan = 'procedure') or (masukan = 'function') or (masukan = 'begin');
          end;
     end;
end;

procedure varDec;
begin
     identifier;
     while not(masukan = ':')do
     begin
          writeln;cek(',');
          identifier;
     end;
     writeln;cek(':');
     p_type;
end;

procedure varDecPart;
begin
     if masukan = 'var' then
     begin
          cek('var');
          varDec;
          writeln;cek(';');
          if not((masukan = 'procedure') or (masukan = 'function') or (masukan = 'begin')) then
          begin
               repeat
                     varDec;
                     writeln;cek(';');
               until (masukan = 'procedure') or (masukan = 'function') or (masukan = 'begin');
          end;
     end;
end;

procedure parameterGroup;
begin
     identifier;
     while not(masukan = ':') do
     begin
          cek(',');
          identifier;
     end;
     writeln;cek(':');
     identifier;
end;

procedure formalParam;
begin
     if masukan = 'var' then
     begin
          cek('var');
          parameterGroup;
     end
     else if masukan = 'function' then
     begin
          cek('function');
          parameterGroup;
     end
     else if masukan = 'procedure' then
     begin
          cek('procedure');
          identifier;
          while not(masukan = ')') do
          begin
               cek(',');
               identifier;
          
          end;
     end
     else
         parameterGroup;
end;

procedure procHead;
begin
     cek('procedure');
     identifier;
     if masukan = '(' then
     begin
          writeln;cek('(');
          formalParam;
          writeln;cek(';');
          while not(masukan = ')') do
          begin
               formalParam;
               writeln;cek(';');
          end;
          writeln;cek(')');
     end;
     writeln;cek(';');
end;

procedure procDec;
begin
     procHead;
     block;
end;

procedure funcHead;
begin
     cek('function');
     identifier;
     if masukan = '(' then
     begin
          cek('(');
          formalParam;
          cek(';');
          while not(masukan = ')') do
          begin
               formalParam;
               cek(';');
          end;
          cek(')');
     end;
     writeln;cek(':');
     identifier;
     writeln;cek(';');
end;

procedure funcDec;
begin
     funcHead;
     block;
end;

procedure procFuncDec;
begin
     if masukan= 'procedure' then
         procDec
     else if masukan= 'function' then
         funcDec;
end;

procedure procFuncDecPart;
begin
     while not(masukan = 'begin') do
     begin
          procFuncDec;
     end;
end;

procedure addOp;
begin
     if masukan = '+' then
        cek('+')
     else if masukan = '-' then
        cek('-')
     else if masukan = 'or' then
        cek('or');
end;

procedure factor;
begin
     if masukan = '(' then
     begin
          cek('(');
          expression;
          writeln;cek(')');
     end
     else if masukan = 'not' then
         begin
              cek('not');
              factor;
         end
     else if masukan[1] in [chr(39),'0'..'9'] then
          unsignedconst
     else
         variable;
end;

procedure multiOp;
begin
     if masukan = '*' then
        cek('*')
     else if masukan = '/' then
        cek('/')
     else if masukan = 'div' then
        cek('div')
     else if masukan = 'mod' then
        cek('mod')
     else if masukan = 'and' then
        cek('and');
end;

procedure term;
begin
     factor;
     if (masukan = '*') or (masukan = '/') or (masukan = 'div') or (masukan = 'mod') or (masukan = 'and') then
     begin
          writeln;multiOp;
          term;
     end;

end;

procedure simpleEx;
begin
     if(masukan = '-') or (masukan = '+') then
     begin
          sign;
     end;
     term;
     if (masukan = '+') or (masukan = '-') or (masukan = '+') then
     begin
          writeln;addOp;
          term;
     end;
end;

procedure expression;
begin
     simpleEx;
     if (masukan = 'in') or (masukan = '=') or (masukan = '>') or (masukan = '>=') or (masukan = '<>') or (masukan = '<') or (masukan = '<=') then
     begin
          writeln;relationalOp;
          simpleEx;
     end;
end;

procedure entirevar;
begin
     identifier;
end;

procedure componentvar;
begin
     identifier;
     writeln;cek('[');
     expression;
     while not(masukan = ']') do
     begin
          cek(',');
          expression;
     end;
     cek(']');
end;

procedure variable;
begin
     if stack[i+1] = '[' then
        componentvar
     else
         entirevar;
end;

procedure procstmt;
begin
     identifier;
     if masukan = '(' then
     cek('(');
     expression;
     while masukan = ')' do
     begin
           cek(',');
           expression;
     end;
     cek(')');
end;

procedure assignstmt;
begin
     variable;
     writeln;cek(':=');
     expression;
     writeln;cek(';');
end;

procedure simplestmt;
begin
     if stack[i+c_block+1] = ':=' then
        assignstmt
     else
        procstmt;
end;

procedure compoundstmt;
begin
     cek('begin');
     statement;
     while not(masukan = 'end') do
     begin
          statement
     end;
     cek('end');
end;

procedure ifstmt;
begin
     writeln(stack[i],' ini');cek('if');

end;

procedure repetitivestmt;
begin

end;

procedure casestmt;
begin

end;

procedure conditionalstmt;
begin
     if masukan = 'if' then
         ifstmt
     else if masukan = 'case' then
         casestmt;
end;

procedure structuredstmt;
begin
     if masukan = 'begin' then
        compoundstmt
     else if(masukan = 'if') or (masukan = 'case') then
          conditionalstmt
     else
          repetitivestmt;
end;

procedure statement;
begin
     if masukan = 'begin' then
         structuredstmt
     else
         simplestmt;
end;

procedure statementPart;
begin
     statement;
end;

procedure block;
begin
     typeDefPart;
     constDefPart;
     varDecPart;
     procFuncDecPart;
     statementPart;
end;

procedure parser;
begin
     writeln;
     writeln('==========PROSES PARSING==========');
     i := 1;

     cek('program');
     identifier;
     writeln;cek(';');
     block;


     writeln;       
     writeln('PROGRAM');
     hasil := 'DITERIMA';
     writeln;
     writeln(hasil);
end;

begin
     scan;
     parser;
     readln;
end.

{
     z :=1;
     scan;
     repeat
           writeln(stack[z]);
           z := z+1;
     until z = 30;
     readln;

}
