// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import "forge-std/Script.sol";
import "../src/ERC20token.sol";

contract DeployToken is Script {
    function run() external {
        vm.startBroadcast();

        // deploy the token with name and symbol
        new ERC20token("MyToken", "MTK");

        vm.stopBroadcast();
    }
}
