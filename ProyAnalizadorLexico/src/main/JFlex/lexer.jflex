import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

%%
%public
%class Lexer
%standalone

%{
    private List<String> tokens= new ArrayList<>();
%}

%{
    public List<String> analizar(String archivo){
        FileReader in = null;
        try{
            in = new FileReader(archivo);
            Lexer lexer = new Lexer(in);
            while(!lexer.zzAtEOF){
                lexer.yylex();
        }
        }catch(Exception ex){
            System.out.println("Error al analizar el archivo");
        }finally{
            try{
                in.close();
                }catch(Exception ex){
                    System.out.println("Error al cerrar el archivo");
                }
        }
        return tokens;
    }

%}

%{
public String lexeme;
%}

%%
[a-z A-Z 0-9 ! º ª @ · # $ % & = ' ´ + ? < > "-" ¿ ‚ ¡ ` * + ¨ Ç : , ;]+["("][a-z A-Z 0-9 ! º ª @ · # $ % & = ' \" ´ "[" "]" + ? < > "-" ¿ ‚ ¡ ` * + ¨ Ç : , ;]+[")"] {tokens.add("predicado"); lexeme=yytext(); System.out.println("predicado");}
["+""-"0-9 "."][0-9]*["."]*[0-9]*["E""e"]+["+""-"0-9]+[0-9]* {tokens.add("pto_float"); lexeme=yytext(); System.out.println("pto_float");}
["+""-"0-9] [0-9]* {tokens.add("entero"); lexeme=yytext(); System.out.println("entero");}
["+""-"0-9"."]+[0-9]*["."][0-9]* {tokens.add("pto_fijo"); lexeme=yytext(); System.out.println("pto_fijo");}
[a-z][a-z A-Z 0-9 _]+ {tokens.add("atomo"); lexeme=yytext(); System.out.println("atomo");}
[A-Z"_"]+[a-zA-Z0-9_]* {tokens.add("var"); lexeme=yytext(); System.out.println("variable");}
":-"+ {tokens.add("impl"); lexeme=yytext(); System.out.println("implica");}
[']+[a-zA-Z!ºª@·#$%&=´+?<>"-"¿‚¡`*+¨Ç :]*[']+ {tokens.add("atomo"); lexeme=yytext(); System.out.println("atomo");}
[!ºª@·#$%&=´+?<>"-"¿‚¡`*+¨Ç:]+ {tokens.add("atomo"); lexeme=yytext(); System.out.println("atomo");}
[\"][a-zA-Z0-9!ºª@·#$%&='´+?<>"-"¿‚¡`*+¨Ç:,;]+[\"]+ {tokens.add("cadena"); lexeme=yytext(); System.out.println("cadena");}
["["][a-zA-Z0-9!ºª@·#$%&='´+?\"<>"-"¿‚¡()`*+¨Ç:,;]+["]"] {tokens.add("list"); lexeme=yytext(); System.out.println("lista");}
[,]+ {tokens.add("coma"); lexeme=yytext(); System.out.println("coma");}
[(]+ {tokens.add("par_izq"); lexeme=yytext(); System.out.println("par_izq");}
[)]+ {tokens.add("par_der"); lexeme=yytext(); System.out.println("par_der");}
[;]+ {tokens.add("punt_coma"); lexeme=yytext(); System.out.println("punt_coma");}
[.]+ {tokens.add("punto"); lexeme=yytext(); System.out.println("punto");}
