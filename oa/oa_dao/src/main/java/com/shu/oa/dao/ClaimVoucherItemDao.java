package com.shu.oa.dao;

import com.shu.oa.entity.ClaimVoucherItem;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("claimVoucherItemDao")
public interface ClaimVoucherItemDao {
    void insert(ClaimVoucherItem claimVoucherItem);

    void update(ClaimVoucherItem claimVoucherItem);

    void delete(int id);

    List<ClaimVoucherItem> selectByClaimVoucher(int cvid);
}
