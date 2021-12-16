// SPDX-License-Identifier: MIT

pragma solidity >=0.7.8;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Funding is ReentrancyGuard, Context{

    struct infoFunding{
        uint256 id; // id fundraising
        address chairPerson; 
        uint256 totalFundPerson;
        uint256 totalSupply;
        uint256 timeEndFund;
        address[] presonFund;
    }
    event NewFunding(uint256 id,uint256 totalSupply,uint256 timeEndFund);

    mapping (uint256 => infoFunding) public fundToOwer;
    mapping (address => uint) ownerFunding;

    function _register(uint256 _id,uint256 _totalSupply,uint256 _timeEnd) internal {
        infoFunding storage _in = fundToOwer[_id];
        _in.chairPerson = _msgSender();
        _in.totalSupply = _totalSupply;
        _in.timeEndFund = _timeEnd;
        emit NewFunding(_id,_totalSupply,_timeEnd);
    }

    function _bib(uint256 _id, uint256 _fee) internal {
        infoFunding storage _in = fundToOwer[_id];
        _in.totalFundPerson += _fee;
        _in.presonFund.push(_msgSender());
    }

}

