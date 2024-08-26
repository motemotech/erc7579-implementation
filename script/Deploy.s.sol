// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { Script } from "forge-std/Script.sol";
import { MSAAdvanced } from "src/MSAAdvanced.sol";
import { MSAFactory } from "src/MSAFactory.sol";
import { Bootstrap } from "src/utils/Bootstrap.sol";
import "forge-std/console.sol";

/**
 * @title Deploy
 * @author @kopy-kat
 */
contract DeployScript is Script {
    function run() public {
        bytes32 salt = bytes32(uint256(3434364614453));

        vm.startBroadcast(vm.envUint("PK"));

        // Deploy account and factory
        MSAAdvanced msaAdvanced = new MSAAdvanced{ salt: salt }();
        MSAFactory msaFactory = new MSAFactory{ salt: salt }(address(msaAdvanced));
        console.log("msaFactory", address(msaFactory));

        // Deploy Bootstrap
        Bootstrap bootstrap = new Bootstrap{ salt: salt }();

        vm.stopBroadcast();
    }
}
