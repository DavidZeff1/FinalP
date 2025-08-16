import React, { useState, useEffect } from "react";
import NavbarComponent from "../Pages/NavbarComponent"
import "../../CSS/Othello.css"; // Add styles here

const BOARD_SIZE = 8; // Standard Othello size

// Cell component to represent a board tile
function Cell({ value, onClick }) {
  const cellClass = value === "X" ? "cell-x" : value === "O" ? "cell-o" : "cell-empty";
  return (
    <div className={`cell ${cellClass}`} onClick={onClick}>
      {value}
    </div>
  );
}

// Main Othello game component
function OthelloComponent() {
  const [board, setBoard] = useState([]);
  const [currentPlayer, setCurrentPlayer] = useState("X");
  const [possibleMoves, setPossibleMoves] = useState([]);

  // Initialize the board
  useEffect(() => {
    const initialBoard = Array(BOARD_SIZE)
      .fill(null)
      .map(() => Array(BOARD_SIZE).fill(""));
    // Set starting pieces
    const mid = BOARD_SIZE / 2;
    initialBoard[mid - 1][mid - 1] = "O";
    initialBoard[mid - 1][mid] = "X";
    initialBoard[mid][mid - 1] = "X";
    initialBoard[mid][mid] = "O";
    setBoard(initialBoard);
  }, []);

  const handleCellClick = (row, col) => {
    // Only handle clicks on valid cells
    if (!possibleMoves.some(move => move.row === row && move.col === col)) return;

    const newBoard = [...board];
    newBoard[row][col] = currentPlayer;
    setBoard(newBoard);

    // Flip logic would go here, or API call
    const nextPlayer = currentPlayer === "X" ? "O" : "X";
    setCurrentPlayer(nextPlayer);

    // Recalculate possible moves for the next player
    // This should come from logic or API call
    setPossibleMoves([]);
  };

  const renderBoard = () =>
    board.map((row, rowIndex) => (
      <div key={rowIndex} className="row">
        {row.map((cell, colIndex) => (
          <Cell
            key={`${rowIndex}-${colIndex}`}
            value={cell}
            onClick={() => handleCellClick(rowIndex, colIndex)}
          />
        ))}
      </div>
    ));

  return (
    <>
    <NavbarComponent/>
    <div className="othello-game">
      <h1>Othello</h1>
      <div className="board">{renderBoard()}</div>
      <div className="info">
        <p>Current Player: {currentPlayer}</p>
      </div>
    </div>
    </>
    
  );
}

export default OthelloComponent;
