pragma solidity ^0.4.0;

contract Calculate {
    int256 initial = 0;
    
    
   function getLastResult () public view returns(int256) {
       return initial;
   }
   
   function resetState () public {
       initial = 0;
   }
    
   function add (int256 b) public returns(int256) {
       initial += b;
       return initial;
   }
   
   function substract (int256 b) public returns(int256) {
       initial -= b;
       return initial;
   }
   
   function multiply (int256 b) public returns(int256) {
       initial *= b;
       return initial;
   }
   
   function divide (int256 b) public returns(int256) {
       initial /= b;
       return initial;
   }
   
   function remainder (int256 b) public returns(int256) {
       initial %= b;
       return initial;
   }
   
   function power (uint256 b) public returns(int256) {
       int256 result;
       int8 negativeEvaluator = 1;
       uint256 initialPositive;
       
       if(initial < 0) {
           initialPositive = uint256(initial * -1);
           
           if(b % 2 != 0){
               negativeEvaluator = -1;
           }
       }
       
       initialPositive = uint256(initial);
       
       result = int256(initialPositive**b) * negativeEvaluator;
       initial = result;
       return result;
   }
}
