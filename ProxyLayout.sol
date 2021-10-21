// SPDX-License-Identifier: MIT
pragma solidity 0.8.5;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "./TitanToken.sol";

/// @title Layout contract
/// @author hu-yuu
/// @notice Storage layout for proxy and factory contracts
contract ProxyLayout is Ownable  {
    address public otherContractAddress;
    TitanToken public token;

    /// @notice sets the factory contract address
    function setOtherAddressStorage(address _otherContract) internal {
        otherContractAddress = _otherContract;
    }
    
    /// @notice sets the token contract address
    function setTokenAddress(address _token) internal {
        token = TitanToken(_token);
    }
}