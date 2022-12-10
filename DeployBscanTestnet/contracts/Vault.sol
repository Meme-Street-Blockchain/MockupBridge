//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;
import "openzeppelin-solidity/contracts/token/ERC20/utils/SafeERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";


contract Vault is Ownable {
    IERC20 private token;
    uint256 public maxWithdrawAmount;
    bool public withdrawEnable;
  //  bytes32 public constant WITHDRAWER_ROLE = keccak256("WITHDRAWER_ROLE");
    event EventWithdraw(uint amount, address to);
    event UserDeposit(uint user_amount, address UserAddress);
    event TopUp(uint AdminAmount);
    function setToken(IERC20 _token) public onlyOwner {
        token = _token;
    }
    function setWithdrawEnable(bool _isEnable) public onlyOwner {
        withdrawEnable = _isEnable;
    }
    function setMaxWithdrawAmount(uint256 _maxAmount) public onlyOwner {
        maxWithdrawAmount = _maxAmount;
    }
      function deposit(uint256 _amount) external {
       // require(!isContract(msg.sender));
        require(
            token.balanceOf(msg.sender) >= _amount,
            "Insufficient account balance"
        );
        SafeERC20.safeTransferFrom(token, msg.sender, address(this), _amount);
        emit UserDeposit(_amount,msg.sender );
    }

    constructor() {
     
    }
     function isContract(address addr) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(addr)
        }
        return size > 0;
    }
   function withdraw(
        uint256 _amount,
        address _to
    ) external onlyOwner {
        require(!isContract(msg.sender));
        require(withdrawEnable,"Withdraw is not available");
        require(_amount<=maxWithdrawAmount,"Exceed maximum amount");
        token.transfer(_to, _amount);
        emit EventWithdraw( _amount,_to);
    }

    // receive()external payable{
    //     if (msg.sender == owner()){
    //         emit TopUp(msg.value);
    //     }
    //     else{
    //         emit UserDeposit(msg.value, msg.sender);
    //     }

    // }
    

}