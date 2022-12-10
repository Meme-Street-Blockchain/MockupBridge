//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "openzeppelin-solidity/contracts/access/Ownable.sol";


contract Vault is Ownable {
    uint256 public maxWithdrawAmount;
    bool public withdrawEnable;
    bytes32 public constant WITHDRAWER_ROLE = keccak256("WITHDRAWER_ROLE");
    event EventWithdraw(uint amount, address to);
    event UserDeposit(uint user_amount, address UserAddress);
    event TopUp(uint AdminAmount);

    function setWithdrawEnable(bool _isEnable) public onlyOwner {
        withdrawEnable = _isEnable;
    }
    function setMaxWithdrawAmount(uint256 _maxAmount) public onlyOwner {
        maxWithdrawAmount = _maxAmount;
    }
    constructor() {
     
    }
    function withdraw(
        uint256 _amount,
        address _to
    ) external onlyOwner {
        require(withdrawEnable,"Withdraw is not available");
        require(_amount<=maxWithdrawAmount,"Exceed maximum amount");
        payable(_to).transfer(_amount);
        emit EventWithdraw(_amount, _to);
    }

    receive()external payable{
        if (msg.sender == owner()){
            emit TopUp(msg.value);
        }
        else{
            emit UserDeposit(msg.value, msg.sender);
        }

    }
    

}