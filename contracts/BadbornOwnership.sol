pragma solidity ^0.8.7;

import "./BadbornBase.sol";
import "./ERC721.sol";

contract BadbornOwnership is BadbornBase, ERC721 {

    constructor() BadbornBase(dnaDigits){}


    function balanceOf(address _owner) external view override returns (uint256 balance){
        return ownerBadbornCount[_owner];
    }

    function ownerOf(uint256 _tokenId) external view override returns (address owner){
        return badbornToOwner[_tokenId];
    }
    
    function transferFrom(address from, address to, uint256 tokenId) external override {
        require(msg.sender == badbornToOwner[tokenId]);
        ownerBadbornCount[to]++;
        ownerBadbornCount[from]--;
        badbornToOwner[tokenId] = to;
        emit Transfer(from, to, tokenId);
    }
}