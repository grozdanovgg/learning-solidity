pragma solidity ^0.4.21;

contract StructExercise {
        
    struct UserData {
        uint counter;
        uint date;
        address currentAddress;
    }
    
    enum States { Locked, Unlocked, Restricted }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    modifier checkState {
        bool accessAllowed = false;
        if(state == States.Unlocked){
            accessAllowed = true;
        } else if( state == States.Restricted && msg.sender == owner){
            accessAllowed = true;
        }
        require(accessAllowed);
        _;
    }
    
    address owner;
    uint counter;
    States state;
    UserData lastUser;
    
    function StructExercise() public{
        owner = msg.sender;
    }
    
    function() public payable checkState{
        
    }
    
    function changeState(States newState) public onlyOwner{
       state = newState;
    }
    
    function logAction() public checkState{
        counter += 1;
        lastUser = UserData({
            counter: counter,
            date: now,
            currentAddress: msg.sender
        });
    }
}
