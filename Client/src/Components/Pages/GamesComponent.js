import NavbarComponent from "./NavbarComponent"
import GameCardComponent from "../GamesPageComponents/GameCardComponent"
import { Link } from "react-router-dom";
import '../../CSS/GamesComponent.css';

export default function GamesComponent() {
    return(
        <>
            <NavbarComponent/>
            
            <div className="game-cards-contanier">
                <Link to="/othello" >
                    <GameCardComponent 
                        gameIMG = "/images/othello-game-img.png"
                        gameName ="Othello"
                    />
                </Link>
                <Link to="/othello" >
                    <GameCardComponent 
                        gameIMG = "/images/tic-tac-toe-img.png"
                        gameName ="Tic Tac Toe"
                    />
                </Link>
            </div>
        </>
        );
}