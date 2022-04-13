// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.6;
import "hardhat/console.sol";

contract Student
{
    struct student_info
    {
        address student_addr;
        address school_addr;
        string student_name;
    }

    mapping(address => student_info) student_view;

    mapping(address => student_info[]) school_view;

    function add_student(address st_adr, address sch_adr, string memory st_name) public returns (bool)
    {
        student_info memory temp_s_info;
        temp_s_info.student_addr = st_adr;
        temp_s_info.school_addr = sch_adr;
        temp_s_info.student_name = st_name;
        student_view[st_adr] = (temp_s_info);
        school_view[sch_adr].push(temp_s_info);
        return true;
    }

    function get_student_info() public view returns(student_info memory)
    {
        return student_view[msg.sender];
    }

    function get_school_info() public view returns(student_info[] memory)
    {
        return school_view[msg.sender];
    }
}
