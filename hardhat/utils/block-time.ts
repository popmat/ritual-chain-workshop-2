export function secondsToBlocks(
  seconds: number,
  blockTimeMs: number,
): number {
  if (seconds < 0) {
    throw new Error(
      "seconds cannot be negative",
    );
  }

  if (blockTimeMs <= 0) {
    throw new Error(
      "block time must be positive",
    );
  }

  return Math.floor(
    seconds * 1000 / blockTimeMs,
  );
}

export function calculateDeadline(
  currentBlock: bigint,
  durationSeconds: number,
  blockTimeMs: number,
): bigint {
  const blocks = secondsToBlocks(
    durationSeconds,
    blockTimeMs,
  );

  return currentBlock +
    BigInt(blocks);
}

export function hasPassedDeadline(
  currentBlock: bigint,
  deadline: bigint,
): boolean {
  return currentBlock >= deadline;
}
