pragma solidity ^0.4.21;

contract Mapping {
    
    mapping(address => uint) public balances;

    function update(uint newBalance) public {
        balances[msg.sender] = newBalance;
    } 
}
