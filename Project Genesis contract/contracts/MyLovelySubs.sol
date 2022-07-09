// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract MyLovelySubs is ERC721{

    uint256 public nextTokenId=0;
    uint256 public _1minted=0;
    uint256 public _2minted=0;
    uint256 public _1totalSupply=69;
    uint256 public _2totalSupply=100;
    address public admin;
    struct Owner {
        uint tokenId;
        string name;
    }
    Owner[] public _1owners;
    Owner[] public _2owners;
    
    constructor() public ERC721("Welcome to the Gang ❤ - Abhinav", "ABS") {
        admin = msg.sender;
    }
    function mint(uint _token,string memory _ownerName,string memory _tokenUri)public {
       if(_token==1 && _1minted<_1totalSupply){
        _safeMint(_msgSender(),nextTokenId);
        _setTokenURI(nextTokenId,_tokenUri);
        Owner memory owner = Owner(nextTokenId,_ownerName);
        _1owners.push(owner);
        _1minted++;
       }
       else if(_token==2 && _2minted<_2totalSupply){
        _safeMint(_msgSender(),nextTokenId);
        _setTokenURI(nextTokenId,_tokenUri);
        Owner memory owner = Owner(nextTokenId,_ownerName);
        _2owners.push(owner);
        _2minted++;
       }else{
           nextTokenId--;
       }
       nextTokenId++;
    }
    function get1Owners()public view returns (Owner[] memory){
        return _1owners;
    }
    function get2Owners()public view returns (Owner[] memory){
        return _2owners;
    }
    function editSupply(uint _token,uint _newSupply) public {
        if(_msgSender()==admin){
            if(_token==1){
                _1totalSupply=_newSupply;
            }else if(_token==2){
                _2totalSupply=_newSupply;
            }
        }
    }
}

