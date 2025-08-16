export default function GamesCardComponent(props) {
    return(
            <div className="game-card">
                <img src={process.env.PUBLIC_URL + props.gameIMG} alt="" />
                <br />
                <p>Play {props.gameName}!</p>

            </div>
        );
}