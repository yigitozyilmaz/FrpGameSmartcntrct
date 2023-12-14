// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
interface i_battle {
    function calculateDamage(uint256 diceResult) external returns (bool);
}



contract RandomGenerator {
    uint256 constant MAX_NUMBER = 100;
  i_battle public battleContract;
    function random() internal view returns (uint256) {
    uint256 randomNumber = uint256(keccak256(abi.encodePacked(
            tx.origin,
            blockhash(block.number - 1),
            block.timestamp
        )));

        return (randomNumber % MAX_NUMBER) + 1;
    }


    
    function getRandomResult() public {
        uint256 deneme=random();
        battleContract.calculateDamage(deneme);
    }

    function pickRandomItem() internal view returns (uint8) {
            uint256 randomNumber = uint256(keccak256(abi.encodePacked(
            tx.origin,
            blockhash(block.number - 1),
            block.timestamp
        )));
        uint256 selection = randomNumber % MAX_NUMBER;
        
        if (selection < 30) {
            return 1;
        } else if (selection < 70) {
            return 2;
        } else {
            return 3;
        }
    }
    
    // Bu fonksiyon sonucu döndürür
    function zar3() public view returns (uint8) {
        return pickRandomItem();
    }

     constructor(i_battle battleContractx) {
    battleContract=battleContractx;
    }

   
}

    