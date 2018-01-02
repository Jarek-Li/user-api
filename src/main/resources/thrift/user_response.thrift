namespace java com.today.api.user.response

include 'user_enum.thrift'

/**
* 注册用户返回体
**/
struct RegisterUserResponse {
    /**
    * 用户名称
    **/
    1:string userName,
    /**
    * 电话号码
    **/
    2: string telephone,
    /**
    * 用户状态
    **/
    3: user_enum.UserStatusEnum status,
    /**
    * 注册时间
    **/
    4: i64 createdAt,
    
}

/**
* 修改用户返回体
**/
struct ModifyUserResponse {
    /**
    * 用户名称
    **/
    1:string userName,
    /**
    * 电话号码
    **/
    2: string telephone,
    /**
    * 用户状态
    **/
    3: user_enum.UserStatusEnum status,
    /**
    * 用户邮箱
    **/
    4: optional string email,
    /**
    * 用户 qq
    **/
    5: optional string qq,
    /**
    * 更新时间
    **/
    6: i64 updatedAt,

}

/**
* 用户登录返回体
**/
struct LoginUserResponse {
    /**
    * 用户名称
    **/
    1:string userName,
    /**
    * 电话号码
    **/
    2: string telephone,
    /**
    * 用户状态
    **/
    3: user_enum.UserStatusEnum status,
    /**
    * 用户邮箱
    **/
    4: optional string email,
    /**
    * 用户 qq
    **/
    5: optional string qq,
    /**
    * 用户 积分
    **/
    6: i32 integral ,
    /**
    * 注册时间
    **/
    7: i64 createdAt,
    /**
    * 更新时间
    **/
    8: i64 updatedAt,
}

/**
* 冻结操作返回体
**/
struct FreezeUserResponse {
    /**
    * 用户 id
    **/
    1: string userId,
    /**
    * 用户状态
    **/
    2: user_enum.UserStatusEnum status,
    /**
    *  操作员冻结备注
    **/
    3: string remark,
}

/**
* 拉黑操作返回体
**/
struct BlackUserResponse {
    /**
    * 用户 id
    **/
    1: string userId,
    /**
    * 用户状态
    **/
    2: user_enum.UserStatusEnum status,
    /**
    *  操作员冻结备注
    **/
    3: string remark,
}