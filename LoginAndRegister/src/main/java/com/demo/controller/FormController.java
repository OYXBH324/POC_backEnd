package com.demo.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.demo.filter.Privilege;
import com.demo.model.po.ProcessForm;
import com.demo.model.po.system.User;
import com.demo.result.R;
import com.demo.service.FormService;
import com.demo.service.impl.FormServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/form")
public class FormController {

    @Autowired
    FormServiceImpl formService;

    @Privilege("self")
    @PostMapping("/statistics")
    public R statistic(HttpServletRequest request,@RequestBody String body){
        return R.ok().setData(formService.statistic());
    }

    @Privilege("self")
    @PostMapping("/createForm")
    public R createForm(HttpServletRequest request,@RequestBody String body) {
        ProcessForm processForm = JSONObject.parseObject(body, ProcessForm.class);
        processForm.setApprove(0);
        processForm.setCompleted(0);
        processForm.setPerformed(0);
        formService.createForm(processForm);
        return R.ok("OK");
    }

    /**
     * 我提交的表单
     */
    @Privilege("self")
    @PostMapping("/getSelfForm")
    public R selectSelfForm(HttpServletRequest request,@RequestBody Map<String,Object> params) {
        Page<ProcessForm> processFormPage = formService.searchForm(0, params);
        return R.ok("OK").setData(processFormPage);
    }

    @Privilege("self")
    @PostMapping("/updateSelfForm")
    public R updateSelfForm(HttpServletRequest request,@RequestBody String body) {
        ProcessForm processForm = JSONObject.parseObject(body, ProcessForm.class);
        processForm.setUserId(null);
        int i = formService.updateSelfForm(processForm);
        if (i == 1) {
            return R.ok("success");
        } else {
            return R.error("failed");
        }
    }

    @Privilege("self")
    @PostMapping("/deleteSelfForm")
    public R deleteSelfForm(HttpServletRequest request,@RequestBody String body) {
        JSONObject json = JSONObject.parseObject(body);
        int i = formService.deleteSelfForm(json.getInteger("id"));
        if (i == 1) {
            return R.ok();
        } else {
            return R.error();
        }
    }
    @Privilege("self")
    @PostMapping("/markAsCompleted")
    public R markAsCompleted(HttpServletRequest request, @RequestBody String body) {
        JSONObject json = JSONObject.parseObject(body);
        int count = formService.markAsCompleted(json.getInteger("id"),json.getInteger("userId"));
        if (count == 1) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    @Privilege("self")
    @PostMapping("/getAllForm")
    public R getAllForms(HttpServletRequest request,@RequestBody String body) {
        JSONObject json = JSONObject.parseObject(body);
        Page<ProcessForm> page = formService.getAllForm(json.getInteger("page"));
        return R.ok().setData(page);
    }

    @Privilege("self")
    @PostMapping("/getAllStaff")
    public R getStaff(HttpServletRequest request,@RequestBody(required = false) String body){
        List<User> allStaff = formService.getAllStaff();
        return R.ok().setData(allStaff);
    }


    @Privilege("performed")
    @PostMapping("/markAsPerformed")
    public R markAsPerformed(HttpServletRequest request,@RequestBody String body) {
        JSONObject json = JSONObject.parseObject(body);
        int count = formService.markAsPerformed(json.getInteger("id"));
        if (count == 1) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    /**
     * approve reject forms
     *
     * @param body
     * @return
     */
    @Privilege("approve")
    @PostMapping("/approve")
    public R approveForms(HttpServletRequest request,@RequestBody String body) {
        JSONObject json = JSONObject.parseObject(body);
        int count = formService.approveOrRejectForms(json.getLong("id"), 1,json.getLong("route"));
        if (count == 1) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    @Privilege("approve")
    @PostMapping("/reject")
    public R rejectForms(HttpServletRequest request,@RequestBody String body) {
        JSONObject json = JSONObject.parseObject(body);
        int count = formService.approveOrRejectForms(json.getLong("id"), -1,0L);
        if (count == 1) {
            return R.ok();
        } else {
            return R.error();
        }
    }
}
