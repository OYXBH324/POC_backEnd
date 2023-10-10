package com.demo.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.Query;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.demo.mapper.FormMapper;
import com.demo.mapper.UserDao;
import com.demo.model.po.ProcessForm;
import com.demo.model.po.system.User;
import com.demo.service.FormService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.nio.file.attribute.UserDefinedFileAttributeView;
import java.sql.Date;
import java.util.List;
import java.util.Map;


@Slf4j
@Service
public class FormServiceImpl {

    private static final int pageSize = 2000;
    @Autowired
    FormMapper formMapper;

    @Autowired
    UserDao userDao;


    public boolean createForm(ProcessForm processForm) {
        int insert = formMapper.insert(processForm);
        return insert > 0;
    }


    public int updateSelfForm(ProcessForm processForm) {
        return formMapper.updateById(processForm);
    }


    public int deleteSelfForm(int id) {
        return formMapper.deleteById(id);
    }


    public Page<ProcessForm> getAllForm(int page){
        return formMapper.selectPage(new Page<>(page, pageSize), null);
    }

    public List<User> getAllStaff(){
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("role",2);
        List<User> users = userDao.selectList(queryWrapper);
        return users;
    }
    public Page<ProcessForm> searchForm(int page, Map<String, Object> params) {
        QueryWrapper<ProcessForm> wrapper =new QueryWrapper<>();
        if(params.containsKey("userId")){
            wrapper.eq("user_id",params.get("userId"));
        }
        if(params.containsKey("approve")){
            wrapper.eq("approve",params.get("approve"));
        }
        if(params.containsKey("performed")){
            wrapper.eq("performed",params.get("performed"));
        }
        if(params.containsKey("completed")){
            wrapper.eq("completed",params.get("completed"));
        }
        if(params.containsKey("route")){
            wrapper.eq("route",params.get("route"));
        }
        return formMapper.selectPage(new Page<>(page, pageSize), wrapper);
    }

    public int markAsCompleted(long id,long userId) {
        ProcessForm processForm = new ProcessForm();
        processForm.setId(id);
        processForm.setCompleted(1);
        return formMapper.updateById(processForm);
    }

    public int markAsPerformed(long id) {
        ProcessForm processForm = new ProcessForm();
        processForm.setId(id);
        processForm.setPerformed(1);
        processForm.setFinishTime(new Date(System.currentTimeMillis()));
        return formMapper.updateById(processForm);
    }

    public int approveOrRejectForms(Long id, int status,long routeId) {
        ProcessForm processForm = new ProcessForm();
        processForm.setId(id);
        processForm.setApprove(status);
        processForm.setRoute(routeId);
        return formMapper.updateById(processForm);
    }

    public JSONObject statistic(){
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("within",formMapper.selectWithin());
        jsonObject.put("later",formMapper.selectLater());
        jsonObject.put("total",formMapper.selectCount(null));
        return jsonObject;
    }
}
