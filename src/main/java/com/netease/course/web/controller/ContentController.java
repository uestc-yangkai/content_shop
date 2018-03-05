package com.netease.course.web.controller;

import com.netease.course.meta.Bill;
import com.netease.course.meta.Content;
import com.netease.course.meta.ContentView;
import com.netease.course.service.BillService;
import com.netease.course.service.ContentService;
import com.netease.course.util.PropertiesRead;
import com.netease.course.util.SendException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by kaizige on 2018/1/28.
 */
@Controller
@RequestMapping("/content")
public class ContentController {
    @Autowired
    ContentService contentService;
    @Autowired
    BillService billService;

    /**
     * 列出所有内容
     * @param map
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("/list")
    public String listContent(ModelMap map,HttpServletResponse response,HttpSession session){
        List<Content> contents=new ArrayList<Content>();
        Object object=session.getAttribute("userName");
        String userName="";
        if(object!=null){
            userName=(String)object;
        }
        contents=contentService.contentList();
        System.out.println(contents);
        map.addAttribute("userName",userName);
        map.addAttribute("contents",contents);
        return "contentList";
    }

    /**
     * 根据id列出某个内容
     * @param contentId
     * @param map
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("/listone")
    public String listContentOne(@RequestParam("contentId") Integer contentId, ModelMap map,HttpServletResponse response,HttpSession session){
        Object object=session.getAttribute("userName");
        String userName=null;
        Integer buyPrice=0;
        if(object!=null){
            userName=(String)object;
        }
        System.out.println(userName);
        Content content=null;
        content=contentService.getContentOneView(contentId);
        System.out.println(content);
        map.addAttribute("content",content);
        map.addAttribute("userName",userName);
        return "contentListOne";
    }

    /**
     * 列出未购买内容
     * @param map
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("/nobuy")
    public String listNobuyContent(ModelMap map,HttpServletResponse response,HttpSession session){
        Object object=session.getAttribute("userName");
        String userName=null;
        Integer buyPrice=0;
        if(object!=null){
            userName=(String)object;
        }
        List<Content> contents=contentService.getNobuyList();
        map.addAttribute("contents",contents);
        map.addAttribute("userName",userName);
        return "contentList";
    }

    /**
     * 上传图片
     * 发布内容
     * @param
     * @param request
     * @param response
     * @param session
     * @param content
     * @param model
     * @return
     */
    @RequestMapping("/add")
    public String addContent( HttpServletRequest request, HttpServletResponse response, HttpSession session,
                             @Validated Content content , BindingResult result ,Model model){
        if(result.hasErrors()){
            List<ObjectError> errors=result.getAllErrors();
            for(ObjectError oe:errors){
                System.out.println(oe.getObjectName());
                System.out.println(oe.getDefaultMessage());
            }
           model.addAttribute("errors",errors);
            return "forward:/api/content/addpre";
        }
            if(contentService.getSumContent()>=1000){
                String msgkey="content.count.limit";
                model.addAttribute("msg",PropertiesRead.getProperty(msgkey));
                return "forward:/api/content/addpre";
            }
            boolean flag=contentService.addContent(content);
            String msgkey=flag?"publish.success":"publish.failure";
             String   msg=PropertiesRead.getProperty(msgkey);
            model.addAttribute("contentId",content.getId());
            model.addAttribute("msg",msg);
            return "ensure";
       // return "forward";
    }
    @RequestMapping("/addpre")
    public String addContentPre( HttpServletRequest request, HttpServletResponse response){
        return "content";
    }
    @RequestMapping("/updatepre/{contentId}")
    public String updateContentPre(@PathVariable("contentId") String contentId, HttpServletRequest request, HttpSession session,HttpServletResponse response,Model model){
        int id=Integer.valueOf(contentId);
        Content content=contentService.getContentOne(id);
        content.setId(id);
        model.addAttribute("content",content);
        System.out.println(content);
        return "updateContent";
    }
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String updateContent(Model model, HttpServletRequest request, Content content,@RequestParam(value = "preImg",required =false) String preImg){
        boolean flag=false;
        flag= contentService.updateContent(content,preImg,request);
        String msgkey=flag?"edit.success":"edit.failure";
//        model.addAttribute("contentId",content.getId());
        System.out.println(content.getId());
        model.addAttribute("msg",PropertiesRead.getProperty(msgkey));
        return "ensure";
    }
    @RequestMapping("/del")
    public String deleteContent(@RequestParam("contentId") int contentId,Model model){
        boolean flag=contentService.deleteContent(contentId);
        String msgkey=flag?"delete.success":"delete.failure";
        model.addAttribute("msg",PropertiesRead.getProperty(msgkey));
        model.addAttribute("url","/spring-web/api/content/list");
        return "forward";
    }
    @RequestMapping("/upload")
    @ResponseBody
    public Map<String,String> upload(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request){
        Map map=new HashMap<String,String>();
        if(multipartFile!=null){
            String filePath=request.getServletContext().getRealPath("/image");
            String fileName=System.currentTimeMillis()+multipartFile.getOriginalFilename();
            File file=new File(filePath,fileName);
            try {
                multipartFile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            map.put("img",fileName);
            System.out.println(fileName);
        }
        return map;
    }
}
