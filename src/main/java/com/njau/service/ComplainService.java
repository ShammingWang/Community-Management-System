package com.njau.service;

import com.njau.repo.pojo.RoomDO;

import java.sql.Timestamp;
import java.util.Date;


/**
 * ComplainService
 *
 * @since 2022/04/23.
 */
public interface ComplainService {
    void deleteByRoom(RoomDO room);
    Boolean setStateAndTimeById(Integer id, String staffUsername, Date handleTime);
}
