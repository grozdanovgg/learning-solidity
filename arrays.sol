pragma solidity ^0.4.21;

contract Arrays {
    bool[5] fixedArray;
    uint[] dynamicArray;
    bytes3 bytesArray = 347834;
    // init a 3 byte integer
    
    function addToFixedArray(bool boolValue, uint8 index) public{
        fixedArray[index] = boolValue;
    }
    function getFixedArrayValue(uint8 index) public view returns(bool){
        return fixedArray[index];
    }
    
    function pushToDynamicArray(uint256 number) public {
        dynamicArray.push(number);
    }
    
    function getDynamicArrayIndex (uint8 index) public view returns(uint256){
        return dynamicArray[index];
    }
    
    function resetArray(uint256 length) public{
        dynamicArray.length = length;
    }
    
}
