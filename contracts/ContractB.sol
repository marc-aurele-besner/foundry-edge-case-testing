//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./test/utils/console.sol";

import "./ContractA.sol";

contract ContractB {
    address public contractA;

    function initialize(address contractA_) external {
        contractA = contractA_;
    }
    function getFunctionB1() public view returns (uint256) {
        return getFunctionB2();
    }

    function getFunctionB2() internal view returns (uint256) {
        return ContractA(contractA).getFunctionA2(block.number - 1);
    }
}
