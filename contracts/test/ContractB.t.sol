// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

/**
 * @title MockERC20 - Test
 */

// import "hardhat/console.sol";
import "./utils/console.sol";
import "./utils/stdlib.sol";
import "./utils/test.sol";
import {CheatCodes} from "./utils/cheatcodes.sol";

import { ContractA } from "../ContractA.sol";
import { ContractB } from "../ContractB.sol";

contract ContractATest is DSTest {
    Vm public constant vm = Vm(HEVM_ADDRESS);

    ContractA private contractA;
    ContractB private contractB;

    function setUp() public {
        // Deploy contracts
        contractA = new ContractA();
        contractB = new ContractB();
        contractB.initialize(address(contractA));
    }

    function test_ContractA_getFunctionA1() public {
        vm.roll(10);
        assertEq((block.number - 1) * 10, contractA.getFunctionA1());
    }

    function test_ContractB_getFunctionB1() public {
        vm.roll(10);
        assertEq((block.number - 1) * 10, contractB.getFunctionB1());
    }
}