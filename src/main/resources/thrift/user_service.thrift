namespace java com.today.api.user.service
include 'user_request.thrift'
include 'user_response.thrift'

service UserService {
/**
### 用户注册

#### 业务描述
    用户注册账户，用户密码需要加盐之后存储(加盐方案还么确定,小伙伴可以自己随意设计个简单的加解密方案)

#### 接口依赖
    无
#### 边界异常说明
    无

#### 输入
    1.user_request.RegisterUserRequest

#### 前置检查
    1. 手机号码规则验证
    2. 手机号未被使用验证
    3. 密码规则,字母数字八位混合

####  逻辑处理
    1.密码加盐处理
    2.新增一条user记录
    3.返回结果 user_response.RegisterUserResponse

#### 数据库变更
    1. insert into user() values()

####  事务处理
    无

####  输出
    1.user_response.RegisterUserResponse
*/
user_response.RegisterUserResponse registerUser (1: user_request.RegisterUserRequest request),

/**
### 用户登录

#### 业务描述
   用户登录

#### 接口依赖
    无
#### 边界异常说明
    无

#### 输入
    1.user_request.LoginUserRequest

#### 前置检查
    1.手机号码规则验证
    2.密码规则,字母数字八位混合

####  逻辑处理
    1. 根据手机号码和密码查询用户记录
    2. 异常用户状态的用户登录返回 Exception

#### 数据库变更
    1. select *  from user where telphone = ? and password = ?

####  事务处理
    无

####  输出
    1.user_response.LoginUserResponse
*/
user_response.LoginUserResponse login (1: user_request.LoginUserRequest request),

/**
### 用户修改个人资料

#### 业务描述
   用户再注册之后完善个人资料,完善资料增加积分5

#### 接口依赖
    无
#### 边界异常说明
    无

#### 输入
    1.user_request.ModifyUserRequest

#### 前置检查
    1. 邮箱规则验证
    2. qq 规则验证
    3. 用户状态判断只有用户状态为

####  逻辑处理
    1. 根据输入的参数计算用户积分
    2. 修改用户 email qq
    2. 修改完成之后调用积分action增加用户积分(完善资料增加积分5) ChangeUserIntegralAction

#### 数据库变更
    1. update user set email = ? , qq = ? where id = ${userId}

####  事务处理
    1. 无

####  输出
    1.user_response.ModifyUserAction
*/
user_response.ModifyUserResponse modifyUser (1: user_request.ModifyUserRequest request),

/**
### 冻结用户接口

#### 业务描述
   用户因为触犯一些游戏规则,后台自检程序或者管理员会冻结该用户

#### 接口依赖
    无
#### 边界异常说明
    无

#### 输入
    1.user_request.FreezeUserRequest

#### 前置检查
    1.用户状态检查(已冻结,已拉黑,已逻辑删除的用户不能冻结)

####  逻辑处理
    1. 设置用户状态为 FREEZE

#### 数据库变更
    1. update user set status = ? , remark = ? where id = ${userId}

####  事务处理
    1. 无

####  输出
    1.user_response.FreezeUserResponse
*/
user_response.FreezeUserResponse freezeUser (1: user_request.FreezeUserRequest request),

/**
### 拉黑用户接口

#### 业务描述
   用户因为触犯一些游戏规则,后台自检程序或者管理员会拉黑该用户,拉黑用户把用户的积分置为0

#### 接口依赖
    无
#### 边界异常说明
    无

#### 输入
    1.user_request.BlackUserRequest

#### 前置检查
    1.用户状态检查(已冻结,已拉黑,已逻辑删除的用户不能拉黑)

####  逻辑处理
    1. 设置用户状态为  BLACK
    2. 调用积分修改接口 ChangeUserIntegralAction

#### 数据库变更
    1. update user set status = ? , remark = ? where id = ${userId}

####  事务处理
    1. 无

####  输出
    1.user_response.BlackUserResponse
*/
user_response.BlackUserResponse blackUser (1: user_request.BlackUserRequest request),


/**
### 记录积分改变流水

#### 业务描述
   用户因为完成一些游戏规则或者触犯游戏规则导致积分减少或者增加,调用该接口修改用户积分

#### 接口依赖
    无
#### 边界异常说明
    无

#### 输入
    1.user_request.ChangeIntegralRequest

#### 前置检查
    1.用户状态检查(已冻结,已拉黑,已逻辑删除的用户不能冻结)

####  逻辑处理
    1. 设置用户状态为 FREEZE

#### 数据库变更
    1. update user set integral = ?  where id = ${userId}
    2. insert into integral_journal() values()

####  事务处理
    1. 无

####  输出
    1. i32 流水 Id
*/
i32 changeUserIntegral (1: user_request.ChangeIntegralRequest request),



}