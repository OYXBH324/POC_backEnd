package com.demo.model.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.sql.Date;

@Data
@TableName("tb_form")
public class ProcessForm {
    @TableId(type = IdType.AUTO)
    private Long id;
    private Long userId;
    private String title;
    private String content;
    private Integer approve;
    private Integer performed;
    private Integer completed;
    private Long route;
    private Date createTime;
    private Date targetTime;
    private Date finishTime;
}
