package com.flash.common.translation.core.impl;

import lombok.AllArgsConstructor;
import com.flash.common.core.service.UserService;
import com.flash.common.translation.annotation.TranslationType;
import com.flash.common.translation.constant.TransConstant;
import com.flash.common.translation.core.TranslationInterface;

/**
 * 用户名称翻译实现
 *
 * @author may
 */
@AllArgsConstructor
@TranslationType(type = TransConstant.USER_ID_TO_NICKNAME)
public class NicknameTranslationImpl implements TranslationInterface<String> {

    private final UserService userService;

    @Override
    public String translation(Object key, String other) {
        if (key instanceof Long id) {
            return userService.selectNicknameById(id);
        } else if (key instanceof String ids) {
            return userService.selectNicknameByIds(ids);
        }
        return null;
    }
}
