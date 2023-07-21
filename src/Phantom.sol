// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Phantom {

    struct Move {
        uint8 action;
        uint32 duration;
        uint64 x_axis;
    }
    
    mapping(address => mapping(uint8 => Move[])) phantom_moves;
    mapping(uint8 => address[]) phantom_users;

    function upload(uint8 world_id, Move[] memory moves) public {
        for (uint i = 0; i < moves.length; i++) {
            phantom_moves[msg.sender][world_id].push(moves[i]);
        }
    }

    function upload_one(uint8 world_id, Move memory move) public {
        phantom_moves[msg.sender][world_id].push(move);
    }

    function retrieve_one(uint8 world_id) public view returns (Move[] memory) {
        return phantom_moves[msg.sender][world_id];
    }
}
