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

%%

[a-z A-Z 0-9 ! º ª @ · # $ % & = ' ´ + ? < > "-" ¿ ‚ ¡ ` * + ¨ Ç : , ;]+["("]+[a-z A-Z 0-9 ! º ª @ · # $ % & = ' \" ´ "[" "]" + ? < > "-" ¿ ‚ ¡ ` * + ¨ Ç : , ;]+[")"]+ {tokens.add("predicado"); System.out.println("predicado");}
["+""-"0-9 "."][0-9]*["."]*[0-9]*["E""e"]+["+""-"0-9]+[0-9]* {tokens.add("pto_float"); System.out.println("pto_float");}
["+""-"0-9] [0-9]* {tokens.add("entero"); System.out.println("entero");}
["+" "-" 0-9 "."]+[0-9]*["."][0-9]* {tokens.add("pto_fijo"); System.out.println("pto_fijo");}
[a-z][a-z A-Z 0-9 _]+ {tokens.add("atomo"); System.out.println("atomo");}
[A-Z"_"]+[a-zA-Z0-9_]* {tokens.add("var"); System.out.println("variable");}
":-"+ {tokens.add("impl"); System.out.println("implica");}
[']+[a-zA-Z!ºª@·#$%&=´+?<>"-"¿‚¡`*+¨Ç: ,;]*[']+ {tokens.add("atomo"); System.out.println("atomo");}
[!ºª@·#$%&=´+?<>"-"¿‚¡`*+¨Ç:,;]+ {tokens.add("atomo"); System.out.println("atomo");}
[\"][a-z A-Z 0-9 ! º ª @ · # $ % & = ' ´ + ? < > "-" ¿ ‚ ¡ ` * + ¨ Ç : , ;]+[\"]+ {tokens.add("cadena"); System.out.println("cadena");}
["["][a-z A-Z 0-9 ! º ª @ · # $ % & = ' ´ + ? \" < > "-" ¿ ‚ ¡ ( ) ` * + ¨ Ç : , ;]+["]"]+ {tokens.add("list"); System.out.println("lista");}