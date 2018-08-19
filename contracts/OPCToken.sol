pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

import "./AccessControl.sol";
import "../installed_contracts/zeppelin/contracts/token/StandardToken.sol";


contract OPCToken is AccessControl, StandardToken {

    address public owner;

    string public symbol;
    string public  name;
    uint8 public decimals;
    
    constructor() public {
        owner = msg.sender;
        symbol = "OPC";
        name = "One Percent Token";
        decimals = 18;
        totalSupply = 1000000 * 10**uint(decimals);
        balances[owner] = totalSupply;
        emit Transfer(address(0), owner, totalSupply);
    }
        
    function kill() public onlyCLevel {
        selfdestruct(this);
    }
}