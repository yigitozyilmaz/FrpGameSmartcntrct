// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract BattleGame {
      uint256 constant MAX_NUMBER = 100;
    uint256 constant MISS_CHANCE = 20; // 20% miss chance

    struct Character {
        uint256 damage;
        uint256 armor;
        uint256 abilty; 
        uint256 agility;
        uint256 health;
    }

    struct BattleResult {
        string message;
        uint256 diceResult1;
        uint256 damage1;
        uint256 damage2;
        uint256 char1Health;
        uint256 char2Health;
    }

     Character[] public characters;
    address public player1;
    address public player2;
    BattleResult[] public battleResults;
    uint256 public currentBattleIndex;

    constructor() {
        characters.push(Character( 5, 2,10,8, 100));  // Character 1
        characters.push(Character( 10, 3,5,15, 100));  // Character 2
        
    }
    
 function charCreate(
        uint256 damage,
        uint256 armor,
        uint256 ability,
        uint256 agility,
        uint256 health
    ) public {
        characters.push(Character(damage, armor, ability, agility, health));
    }



     uint256 public diceSon;
    function calculateDamage(uint256 diceResult ) public returns (bool){
         diceSon=diceResult;
      
     return true;
    }




function calculateDx() private view returns (uint256) {
    if (diceSon == 1) {
        return 0;
    }
    if (diceSon == 25) {
        return 1;
    }
    if (diceSon == 50) {
        return 2;
    }
    if (diceSon == 75) {
        return 3;
    }
    if (diceSon == 100) {
        return 4;
    }
    return 0; // Diğer tüm durumlar için 0
}


}

