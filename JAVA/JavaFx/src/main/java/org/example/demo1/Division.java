package org.example.demo1;

public class Division {
    private int a;
    private int b;

    public Division(int a, int b){
        this.a = a;
        this.b = b;
    }

    public int getA(){
        return a;
    }

    public void setA(int a){
        this.a = a;
    }

    public int getB(){
        return b;
    }

    public void setB(int b){
        this.b = b;
    }

    public double calculate(){
        if (b != 0) {
            return (double) a / b;
        } else {
            throw new ArithmeticException("Cannot divide by zero");
        }
    }
}

