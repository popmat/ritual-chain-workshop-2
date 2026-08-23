# Block deadline notes

This was probably the most interesting design decision for me.

I normally expect a Solidity contract to use block.timestamp for a deadline.

The workshop deliberately does not do that.

The Scheduler works in blocks, so using a block number keeps the betting
deadline and the scheduled resolution point in the same unit.

## Confusing step

I was confused by the conversion from a human duration in seconds to a block
number.

The contract has a deployment-time block time value and uses that to estimate
how many blocks correspond to the requested duration.

## Challenge

The biggest thing I had to watch was the timestamp unit on Ritual Chain.

The workshop explains that it is not the normal Unix timestamp in seconds.

That made me understand why avoiding block.timestamp here is not just a style
choice.

## What I learned

The important idea is not the exact 195ms number.

The important idea is that the contract's deadline and Scheduler execution are
both expressed as block numbers.
