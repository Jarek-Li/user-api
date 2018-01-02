namespace java com.today.api.user.enums

enum UserStatusEnum {
    /**
    * 已激活
    **/
    ACTIVATED = 1,
    /**
    * 权属会员（资料已完善）
    **/
    DATA_PERFECTED = 2,
    /**
    * 冻结用户（涉嫌违规处理冻结期）
    **/
    FREEZED = 3,
    /**
    * 黑名单用户
    **/
    BLACK = 4,
    /**
    * 逻辑删除
    **/
    DELETE = 99,
}

/**
* 积分流水类型
**/
enum IntegralTypeEnum {
    /**
    * 增加流水
    **/
    ADD = 1,
    /**
    * 减少流水
    **/
    MINUS = 2,
}

/**
* 积分来源
**/
enum IntegralSourceEnum {
    /**
    * 完善个人资料
    **/
    PREFECT_INFORMATION = 1,
    /**
    * 拉黑
    **/
    BLACK = 2,
}