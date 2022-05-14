//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./test/utils/console.sol";

contract ContractA {

    function getFunctionA1() external view returns (uint256) {
        return getFunctionA2(block.number - 1);
    }

    function getFunctionA2(uint256 block_) public view returns (uint256) {
        console.log('A2.block.number', block.number);
        console.log('A2.block_', block_);
        return getFunctionA3(block_);
    }

    function getFunctionA3(uint256 block_) internal view returns (uint256) {
        console.log('A3.block_', block_);
        require(block_ < block.number, 'block is not yet minted');
        return block_ * 10;
    }
}
