﻿/*!
 *  @brief     任务控制面板
 *  @details
 *  @author    wlc
 *  @version   1.0
 *  @date      2018.09.20
 *  @warning
 *  @copyright NanJing RenGu.
 *  @note
 */
#ifndef TASKCONTROL_H
#define TASKCONTROL_H

#include <QSharedPointer>
#include <QModelIndex>
#include <QWidget>

#include "head.h"
#include "Base/pluginmanager/observer.h"

class QTimerEvent;

namespace TaskControlModel {

class TaskControlPrivate;

class TaskControl : public QWidget , public Base::Observer
{
    Q_OBJECT
    Q_DECLARE_PRIVATE(TaskControl)
public:
    explicit TaskControl(QWidget *parent = 0);
    ~TaskControl();

    void retranslateUi();
    void onMessage(MessageType::MessType type);
    
private slots:
    void viewTask(QModelIndex); /*!< 查看任务信息 */
    void modifyTask();          /*!< 修改任务信息 */
    void deleteTask();          /*!< 删除任务信息 */
    void copyTable();           /*!< 复制任务信息 */
    void pasteTask();           /*!< 粘贴任务信息 */

    void addNewTask();          /*!< 添加任务 */
    void distributeTask();      /*!< 下发任务 */
    void resetTask();           /*!< 重置任务状态 */

    void updateTaskState();
    void dispatchOver();

    void tableContextPoint(QPoint point);

private:
    QModelIndex currentIndex(bool &validIndex);
    void showEditWindow(QModelIndex index);

    void initDispatch();

    template<class T>
    bool executeCopy(TaskInfo * selectedTask);

private:
    QSharedPointer<TaskControlPrivate> d_ptr;
};

} //namespace TaskControlModel

#endif // TASKCONTROL_H
