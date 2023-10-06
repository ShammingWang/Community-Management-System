package com.njau.service;

import com.njau.domain.vo.UserBillVO;
import com.njau.repo.pojo.UserDO;

/**
 * BillService
 *
 * @since 2022/04/19.
 */
public interface BillService {

    UserBillVO findUserBillByUsername(UserDO user);

    UserBillVO findUserBillByUsernameAndStatus(UserDO user, String status);
}
