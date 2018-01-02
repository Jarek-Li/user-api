namespace java com.xinzhi.services.common.domain

/**
* 分页查询请求包
**/
struct PageRequest {
  /**
  * 查询的开始序号（序号从零开始）
  **/
  1: i32 start,
  /**
  * 返回记录数
  **/
  2: i32 limit,
  /**
  * 排序的字段
  **/
  3: optional string sortFields
}

struct PageResponse {
  /**
  * 查询的开始序号（序号从零开始）
  **/
  1: i32 start,
  /**
  * 最大返回的记录数
  **/
  2: i32 limit,
  /**
  * 结果记录数
  **/
  3: i32 results
}

/**
* 鑫知结算币种
**/
enum Currency {
    /**
    * 心点
    **/
     XUEDIAN = 1 ,
    /**
    * 知点
    **/
    JIAODIAN =2
}
