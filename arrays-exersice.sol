pragma solidity ^0.4.21;

contract ArraysExercise {
    
    struct Proposal {
        address accountToSendTokens;
        uint256 ammountTokens;
    }
    
    modifier onlyOwner {
        bool isOwner = false;
        for(uint i = 0; i < owners.length; i++){
            if(msg.sender == owners[i]){
                isOwner = true;
                break;
            }
        }
        require(isOwner);
        _;
    }
    
    modifier rightOwnerTurn {
        require(msg.sender == owners[expextingOwnerIndex]);
        _;
    }
    
    modifier acceptInTime{
        require(lastAcceptedDate - firstAcceptedDate < 5 minutes);
        _;
    }
    
    modifier proposalUnlockedCheck {
        require(proposalUnlocked);
        _;
    }
    
    address[] owners;
    uint expextingOwnerIndex = 0;
    uint firstAcceptedDate;
    uint lastAcceptedDate;
    bool proposalUnlocked;
    bool proposalAccepted;
    Proposal proposal;
    
    function ArraysExercise (address[] newOwners) public {
        owners = newOwners;
        proposalUnlocked = true;
    }
    
    function() payable public{
        
    }
    
    function makeProposal(address account, uint256 tokens) public proposalUnlockedCheck{
        proposal = Proposal({accountToSendTokens: account,  ammountTokens: tokens});
    
        proposalUnlocked = false;
        expextingOwnerIndex = 0;
    }
    
    function acceptProposal(bool accept) public onlyOwner rightOwnerTurn {
        require(accept);
        
        if(firstAcceptedDate == 0){
            firstAcceptedDate = now;
        }
        
        lastAcceptedDate = now;
        
        expextingOwnerIndex += 1;
        
        if(expextingOwnerIndex == owners.length){
            executeProposal();
        }
    }
    
    function executeProposal() private acceptInTime{
        require(proposal.accountToSendTokens != 0 && proposal.ammountTokens != 0);
        assert(address(this).balance >= proposal.ammountTokens);
        proposal.accountToSendTokens.transfer(proposal.ammountTokens);
        proposalUnlocked = true;
    }
    
    function getexpextingOwnerIndex() public view returns (uint){
        return expextingOwnerIndex;
    }
    
    function getContractBalance () public view returns(uint){
        return address(this).balance;
    }
}
