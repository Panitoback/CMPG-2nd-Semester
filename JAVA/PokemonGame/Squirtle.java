package PokemonGame;

public class Squirtle extends Pokemon implements iAgua{

    public Squirtle(){

    }
    
    @Override
    protected void atacarAraniazo() {
        System.out.println("Squirtle usa araniazo");
     
    }

    @Override
    protected void atacarMordisco() {
        System.out.println("Squirtle usa mordisco");
        
    }

    @Override
    protected void atacarPlacaje() {
        System.out.println("Squirtle usa placaje");
    }

    @Override
    public void atacarBurbuja() {
        System.out.println("Squirtle usa Burbuja");
    }

    @Override
    public void atacarHidrobomba() {
        System.out.println("Squirtle usa Hidrobomba");
    }

    @Override
    public void atacarPistolaAgua() {
        System.out.println("Squirtle usa PistolaAgua");
    }
    
    
}
