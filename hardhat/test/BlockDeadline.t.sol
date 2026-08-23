// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";

contract BlockDeadlineTest is Test {
    uint256 constant BLOCK_TIME_MS = 195;

    function secondsToBlocks(uint256 secondsValue)
        internal
        pure
        returns (uint256)
    {
        return (secondsValue * 1000) / BLOCK_TIME_MS;
    }

    function deadline(
        uint256 currentBlock,
        uint256 durationSeconds
    ) internal pure returns (uint256) {
        return currentBlock + secondsToBlocks(durationSeconds);
    }

    function testOneSecond() public pure {
        assertEq(
            secondsToBlocks(1),
            5
        );
    }

    function testTenSeconds() public pure {
        assertEq(
            secondsToBlocks(10),
            51
        );
    }

    function testDeadlineMovesForward() public pure {
        assertTrue(
            deadline(1000, 10) > 1000
        );
    }

    function testLongerDurationMeansLaterBlock() public pure {
        assertTrue(
            deadline(1000, 20) >
            deadline(1000, 10)
        );
    }

    function testZeroDuration() public pure {
        assertEq(
            deadline(1000, 0),
            1000
        );
    }
}
