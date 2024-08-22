package PokemonGame;

public class Bulbasaur extends Pokemon implements iPlanta{

    public Bulbasaur(){
        
    }

    @Override
    protected void atacarAraniazo() {
        System.out.println("Bulsaur usa araniazo");
        
    }

    @Override
    protected void atacarMordisco() {
        System.out.println("Bulsaur usa mordisco");
        
    }

    @Override
    protected void atacarPlacaje() {
        System.out.println("Bulsaur usa placaje");
    }

    @Override
    public void atacarDrenaje() {
        System.out.println("Bulsaur usa Drenaje");
        
    }

    @Override
    public void atacarParalizar() {
        System.out.println("Bulsaur usa Paralizar");
    }

    
    
    
}
