/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.rules.ExpectedException;
import org.w3c.dom.events.EventException;

/**
 *
 * @author ozzie
 */
public class LexerJUnitTest {
    
    private ByteArrayOutputStream salida;
    private InputStream entrada;
    public ExpectedException thrown= ExpectedException.none();
    
    
    @Before
    public void setUp() {
        this.entrada= System.in;
        this.salida= new ByteArrayOutputStream();
        System.setOut(new PrintStream(salida));
    }
    
    @After
    public void tearDown() {
        System.setIn(entrada);
        System.setOut(null);
    }
    
    @Test 
    public void archivo(){
      String exp="/Users/javiercruz/Documents/UNIVERSIDAD/INTERPRETES/ProyAnalizadorLexico/ProyAnalizadorLexico/src/main/resources/archivo.xyz";
       this.setData(exp);
       Lexer lex = new
           Lexer();
        lex.analizar(exp);
        
    }
    
    @Test (expected = Error.class)
    public void archivoFail(){
      String exp=" ";
       this.setData(exp);
       Lexer lex = new
           Lexer();
        assertEquals(true,lex.analizar(exp));
       
    }
    
    @Test (expected = Exception.class)
    public void entradaFail() throws IOException{
       Lexer lex = new
           Lexer();
        lex.yylex();
    }
    
    @Test
    public void entradayyBegin() throws IOException{
       Lexer lex = new
           Lexer();
       lex.yybegin(40);
    }
    
    @Test
    public void returnyytext(){
       Lexer lex = new
           Lexer();
        lex.yytext();
    }
    
    private void setData(String exp) {
        System.setIn(new ByteArrayInputStream(
                String.format("%s", exp).getBytes()));
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
