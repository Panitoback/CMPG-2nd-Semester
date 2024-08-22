package PokemonGame;

public class Charmander extends Pokemon implements iFuego{

    public Charmander(){
        
    }

    @Override
    protected void atacarAraniazo() {
        System.out.println("Charmander usa araniazo");
        
    }

    @Override
    protected void atacarMordisco() {
        System.out.println("Charmander usa mordisco");
        
    }

    @Override
    protected void atacarPlacaje() {
        System.out.println("Charmander usa placaje");
    }

    @Override
    public void atacarAscuas() {
        System.out.println("Charmander usa Ascuas");
    }

    @Override
    public void atacarLanzallamas() {
        System.out.println("Charmander usa Lanzallamas");
    }

    @Override
    public void atacarPunioFuego() {
        System.out.println("Charmander usa PunioFuego");
    }

    
    
    

}
