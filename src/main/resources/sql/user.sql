
create table if not exists user(
  id int(11) not null comment '利用主键策略生成的唯一键',
  user_name varchar(32) not null comment '用户名',
  password varchar(32) not null comment '密码',
  telephone varchar(32) not null comment '手机号码',
  email varchar(32) not null comment '邮箱',
  qq varchar(32) not null comment ' qq',
  integral int(11) not null comment ' 积分',
  created_at datetime not null comment '创建时间',
  created_by int(11) not null comment '特指后台创建人(公司员工 id)',
  updated_at timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  updated_by int(11) not null comment '特指后台更新人(公司员工 id)',
  remark char(255) not null default '' comment '备注',
  primary key (`id`),
  unique key (`telephone`)
)engine=InnoDB default charset=utf8 comment='用户表';



create table if not exists integral_journal(
  id int(11) not null comment '利用主键策略生成的唯一键',
  user_id int(11) not null comment '用户名',
  integral_type tinyint(2) not null comment '流水类型,1:增加流水(add);2:减少流水(minus)',
  integral_price int(11) not null comment '当前流水涉及到的积分值',
  integral_source tinyint(2) not null comment '流水来源,1:完善个人资料(prefect_information);2:拉黑(black)',
  integral int(11) not null comment '用户当前的积分值',
  created_at datetime not null comment '创建时间',
  created_by int(11) not null comment '特指后台创建人(公司员工 id)',
  updated_at timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  updated_by int(11) not null comment '特指后台更新人(公司员工 id)',
  remark char(255) not null default '' comment '备注',
  primary key (`id`)
)engine=InnoDB default charset=utf8 comment='用户积分流水表';