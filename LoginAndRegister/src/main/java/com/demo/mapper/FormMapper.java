package com.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.demo.model.po.ProcessForm;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface FormMapper extends BaseMapper<ProcessForm> {
    @Select("select count(*) from tb_form where target_time < finish_time and completed = 1")
    public Integer selectLater();

    @Select("select count(*) from tb_form where target_time >finish_time and completed = 1")
    public Integer selectWithin();
}
