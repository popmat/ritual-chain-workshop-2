const blockTimeMs = 195;

function secondsToBlocks(seconds: number): number {
  return Math.floor(
    seconds * 1000 / blockTimeMs,
  );
}

function calculateDeadline(
  currentBlock: number,
  seconds: number,
): number {
  return currentBlock +
    secondsToBlocks(seconds);
}

const currentBlock = 100000;

const durations = [
  1,
  5,
  10,
  30,
  60,
  120,
];

console.log("Block deadline explorer");
console.log("-----------------------");

for (const duration of durations) {
  const blocks = secondsToBlocks(duration);
  const deadline = calculateDeadline(
    currentBlock,
    duration,
  );

  console.log(
    `${duration}s -> ${blocks} blocks -> ${deadline}`,
  );
}

console.log("");
console.log("calculation complete");
