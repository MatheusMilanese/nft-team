pragma solidity ^0.8.7;

import "./Ownable.sol";

contract BadbornBase is Ownable {

    uint dnaDigits;
    uint dnaModulus;

    struct Badborn {
        string name;
        uint id;
        uint dna;
    }
    //1256981010
    /*12 - cabeça 56 - fsdjkl 98 10 10*/
    Badborn[] badborns;

    mapping (uint => address) badbornToOwner;
    mapping (address => uint) ownerBadbornCount;

    constructor(uint _dnaDigits){
        dnaDigits = _dnaDigits;
        dnaModulus = 10 ** dnaDigits;
    }

    function createBadborn(address _owner, string memory _name, uint _dna) public {
        uint id = badborns.length;
        badborns.push(Badborn(_name, _dna, id));
        badbornToOwner[id] = _owner;
        ownerBadbornCount[_owner]++;
    }

    function getBadbornsByOwner(address _owner) external view returns(Badborn[] memory) {
        uint size = ownerBadbornCount[_owner];
        Badborn[] memory badbornsOfOwner = new Badborn[](size);
        uint counter = 0;
        for(uint i = 0; i < badborns.length; i++){
            if(badbornToOwner[i] == _owner){
                badbornsOfOwner[counter] = badborns[i];
                counter++;
            }
        }
        return badbornsOfOwner;
    }
}