// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Phantom {

    struct Move {
        uint8 action;
        uint32 duration;
        uint64 x_axis;
    }
    
    mapping(address => mapping(uint256 => Move[])) phantom_moves;
    mapping(uint256 => address[]) phantom_users;
    mapping(uint256 => uint256) num_user_per_world;

    function upload(uint8 world_id, Move[] memory moves) public {
        if (phantom_moves[msg.sender][world_id].length > 0) 
            delete phantom_moves[msg.sender][world_id];
        else
            num_user_per_world[world_id] ++;

        for (uint i = 0; i < moves.length; i++) {
            phantom_moves[msg.sender][world_id].push(moves[i]);
        }
    }

    function upload_self(uint256 world_id, Move memory move) public {
        phantom_moves[msg.sender][world_id].push(move);
    }

    function retrieve_self(uint256 world_id) public view returns (Move[] memory) {
        return phantom_moves[msg.sender][world_id];
    }

    function retrieve_random(uint256 world_id) public view returns (Move[] memory){
        uint256 db_size = num_user_per_world[world_id];
        uint256 random_num = uint256(keccak256((abi.encodePacked(msg.sender, block.coinbase, block.difficulty)))) % db_size;
        return phantom_moves[phantom_users[world_id][random_num]][world_id];
    }
}
