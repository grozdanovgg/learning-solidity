pragma solidity ^0.4.0;

contract Incrementor {
    uint256 counter;
    uint256 lastIncrementedTime;
    uint8 updateTimeInterval = 15;
    address owner;
    
    function Incrementor (uint256 _counter) public {
        counter = _counter;
        owner = msg.sender;
        lastIncrementedTime = now;
    }
    
    function increment () public returns(uint256, uint256, uint256, bool, bool) {
        bool isIntervalOk = true;
        bool isOwner = owner == msg.sender;
        if((lastIncrementedTime + updateTimeInterval) > now){
            isIntervalOk = false;
        }
        
        if(isIntervalOk && isOwner){
            lastIncrementedTime = now;
            counter += 1;
        }
        
        return (counter, lastIncrementedTime, now, isIntervalOk, isOwner);
    }
}
