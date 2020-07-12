package com.shu.oa.dao;

import com.shu.oa.entity.ClaimVoucher;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("claimVoucherDao")
public interface ClaimVoucherDao {
    void insert(ClaimVoucher claimVoucher);

    void update(ClaimVoucher claimVoucher);

    void delete(int id);

    ClaimVoucher select(int id);

//    根据创建者编号查询
    List<ClaimVoucher> selectByCreateSn(String csn);

    List<ClaimVoucher> selectByNextDealSn(String ndsn);
}
