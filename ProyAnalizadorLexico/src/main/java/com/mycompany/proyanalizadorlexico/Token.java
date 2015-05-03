/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyanalizadorlexico;

/**
 *
 * @author javiercruz
 */
public class Token {
    private Integer renglon;
    private int token;
    private String lexema;

    public Token(Integer renglon, int token, String lexema) {
        this.renglon = renglon;
        this.token = token;
        this.lexema = lexema;
        
        String formato = formato();
        System.out.println(formato);
    }
    public char siguiente(){
        if(renglon<lexema.length())
            return lexema.charAt(renglon++);
        else return 'f';
    }
    
    public void atras(){
        renglon--;
    }
   
    public Integer getLinea() {
        return renglon;
    }

    
    public void setLinea(Integer linea) {
        this.renglon = linea;
    }

    
    public int getToken() {
        return token;
    }

    
    public void setToken(int token) {
        this.token = token;
    }

    
    public String getLexema() {
        return lexema;
    }

    
    public void setLexema(String lexema) {
        this.lexema = lexema;
    }
    
    
    public String formato(){     
        return String.format("%s --- %s --- %s", 
                this.renglon, this.token, this.lexema);
    }
}
