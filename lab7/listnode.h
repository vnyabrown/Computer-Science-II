#pragma once

////////////////////////////////////////////////////////////////////////////////////////////////
//
// File name         : listnode.h
//
// This file.....Contains the listnode struct
// 
//
// Programmer        : B.J. Streller
//
// Date created      : 3/16/21
//
// Date last revised : 3/16/21
//
////////////////////////////////////////////////////////////////////////////////////////////////

template <class BaseData>
struct ListNode
{
public:
    BaseData listData;
    ListNode* link;

};