package PokemonGame;

public class Pikachu extends Pokemon implements iElectrico {
    public Pikachu(){
        
    }

    @Override
    protected void atacarAraniazo() {
        System.out.println("Pikachu usa araniazo");
        
    }

    @Override
    protected void atacarMordisco() {
        System.out.println("Pikachu usa mordisco");
        
    }

    @Override
    protected void atacarPlacaje() {
        System.out.println("Pikachu usa placaje");
    }

    @Override
    public void atacarImpacTrueno() {
        System.out.println("Pikachu usa Trueno");
    }

    @Override
    public void atacarPunioTrueno() {
        System.out.println("Pikachu usa Punio tureno");
    }

    
    
}
