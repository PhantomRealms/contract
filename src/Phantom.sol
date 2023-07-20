// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Phantom {

    struct Move {
        uint8 action;
        uint64 duration;
        uint64 x_axis;
    }
    
    mapping(address => mapping(uint8 => Move[])) phantom_moves;
    mapping(uint8 => address[]) phantom_users;

    function upload(uint8 world_id, Move[] moves) public {
        phantom_moves[msg.sender][world_id] = moves;
    }

    function retrieve_one(uint8 world_id) public returns (Move[]) {
        return phantom_moves[msg.sender][world_id];
    }
}
