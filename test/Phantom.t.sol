// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Phantom.sol";

contract PhantomTest is Test {
    Phantom public phantom;

    function testUpload() public {
        Move[] moves;
        Move memory move = Move(0, 100, 0);
        moves.push(move);
        phantom.upload(0, moves);
        assertEq(phantom.retrieve_one(0), 1);
    }
}
