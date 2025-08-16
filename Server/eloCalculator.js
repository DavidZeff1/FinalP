function updateCardElo(cardRating, wasCorrect, opts = {}) {
  const { opponentRating = 1200, kFactor = 32 } = opts;

  const expectedScore =
    1 / (1 + Math.pow(10, (opponentRating - cardRating) / 400));

  const actualScore = wasCorrect ? 1 : 0;

  const newRating = cardRating + kFactor * (actualScore - expectedScore);
  return Math.round(newRating);
}
