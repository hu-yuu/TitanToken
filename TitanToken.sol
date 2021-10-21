// SPDX-License-Identifier: MIT
pragma solidity 0.8.5;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


/// @title Titan Token
/// @author hu-yuu
/// @notice This is a ERC721 token contract with upgradable data. To upgrade data i use delegatecalls to Factory contracts
contract TitanToken is ERC721, Ownable {
    
    using Counters for Counters.Counter;
    Counters.Counter private tokenId;
    
    address private factory;
    
    constructor()
    ERC721("Titan Token", "TITA")
    {
        tokenId.increment();
    }
    
    
    modifier onlyFactory() {
        require(factory == msg.sender, "Only Factory can call the method");
        _;
    }
    /// @param _factory factory address to delegatecall, mint tokens
    function setFactory(address _factory) public onlyOwner {
        factory = _factory;
    }
    
    /// @notice mint token to _to address
    function mint(address _to) external onlyFactory {
        
        uint256 _tokenId = tokenId.current();
        _mint(_to, _tokenId);
        
        tokenId.increment();
        
    }
    
    
    function getCurrentId() public view returns(uint256) {
        return tokenId.current();
    }
}