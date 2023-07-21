// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Phantom.sol";

contract PhantomTest is Test {

    Phantom public phantom;

    function setUp() public {
        phantom = new Phantom();
    }

    function testUpload() public {
        Phantom.Move[] memory moves = new Phantom.Move[](50);
        for (uint256 i = 0; i < moves.length; i++) {
            moves[i] = Phantom.Move(0, 100, 100);
        }
        phantom.upload(0, moves);
        assertEq(phantom.retrieve_self(0).length, moves.length);
        phantom.upload_self(0, Phantom.Move(0, 100, 0));
        assertEq(phantom.retrieve_self(0).length, moves.length+1);
    }
}
