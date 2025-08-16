function sm2(card, quality) {
  if (quality < 0 || quality > 5) {
    throw new Error("Quality must be between 0 and 5");
  }

  let { repetition, interval, easeFactor, lastReviewDate } = card;

  lastReviewDate =
    lastReviewDate instanceof Date ? lastReviewDate : new Date(lastReviewDate);

  if (quality < 3) {
    repetition = 0;
    interval = 1;
  } else {
    if (repetition === 0) {
      interval = 1;
    } else if (repetition === 1) {
      interval = 6;
    } else {
      interval = Math.round(interval * easeFactor);
    }
    repetition += 1;
  }

  easeFactor =
    easeFactor + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02));
  if (easeFactor < 1.3) {
    easeFactor = 1.3;
  }

  const nextReviewDate = new Date(lastReviewDate);
  nextReviewDate.setDate(nextReviewDate.getDate() + interval);

  return {
    repetition,
    interval,
    easeFactor,
    nextReviewDate,
  };
}
