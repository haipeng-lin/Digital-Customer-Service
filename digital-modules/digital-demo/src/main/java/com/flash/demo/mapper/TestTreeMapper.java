package com.flash.demo.mapper;

import com.flash.common.mybatis.annotation.DataColumn;
import com.flash.common.mybatis.annotation.DataPermission;
import com.flash.common.mybatis.core.mapper.BaseMapperPlus;
import com.flash.demo.domain.TestTree;
import com.flash.demo.domain.vo.TestTreeVo;

/**
 * 测试树表Mapper接口
 *
 * @author haipeng-lin
 * @date 2021-07-26
 */
@DataPermission({
    @DataColumn(key = "deptName", value = "dept_id"),
    @DataColumn(key = "userName", value = "user_id")
})
public interface TestTreeMapper extends BaseMapperPlus<TestTree, TestTreeVo> {

}
