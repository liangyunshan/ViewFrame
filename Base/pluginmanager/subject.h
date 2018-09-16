﻿/*!
 *  @brief     主题
 *  @details   保存订阅端的集合，统一更新操作
 *  @file      subject.h
 *  @author    wey
 *  @version   1.0
 *  @date      2017.12.26
 *  @warning
 *  @copyright NanJing RenGu.
 *  @note 20180427:wey:修改锁为可重入模式，避免在响应OnMessage过程中动态增加Observer
 */
#ifndef SUBJECT_H
#define SUBJECT_H

#include <list>
#include <mutex>

#include "../messagetype.h"
#include "../base_global.h"

namespace Base{

class Observer;

class BASESHARED_EXPORT Subject
{
public:
    Subject();

    void attach(Observer * obj);
    void detach(Observer * obj);

    void notify(MessageType::MessageType type);

private:
    std::list<Observer *> observers;
    std::mutex m_mutex;
};

} //namespace Base

#endif // SUBJECT_H
