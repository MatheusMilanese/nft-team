pragma solidity ^0.8.7;

abstract contract ERC721 {

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    function balanceOf(address _owner) external view virtual returns (uint256 balance);
    function ownerOf(uint256 _tokenId) external view virtual returns (address owner);
    
    function transferFrom(address from, address to, uint256 tokenId) external virtual;
}