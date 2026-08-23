// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";

contract BlockDeadlineEdgesTest is Test {
    function isClosed(
        uint256 currentBlock,
        uint256 deadline
    ) internal pure returns (bool) {
        return currentBlock >= deadline;
    }

    function testBeforeDeadline() public pure {
        assertFalse(
            isClosed(999, 1000)
        );
    }

    function testAtDeadline() public pure {
        assertTrue(
            isClosed(1000, 1000)
        );
    }

    function testAfterDeadline() public pure {
        assertTrue(
            isClosed(1001, 1000)
        );
    }

    function testFarBeforeDeadline() public pure {
        assertFalse(
            isClosed(1, 100000)
        );
    }

    function testFarAfterDeadline() public pure {
        assertTrue(
            isClosed(100001, 100000)
        );
    }

    function testSameBlockIsClosed() public pure {
        uint256 blockNumber = 5000;

        assertTrue(
            isClosed(
                blockNumber,
                blockNumber
            )
        );
    }
}
