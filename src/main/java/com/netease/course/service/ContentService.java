package com.netease.course.service;

import com.netease.course.dao.ContentMapper;
import com.netease.course.meta.Content;
import com.netease.course.meta.ContentView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by kaizige on 2018/1/28.
 */
@Service
public class ContentService {
    @Autowired
    ContentMapper contentMapper;
    public boolean addContent(Content content){
        contentMapper.addContent(content);
        return true;
    }
    public List<Content> contentList(){
        return contentMapper.getContentList();
    }
    public Content getContentOne(int contentId){
       return  contentMapper.getContent(contentId);
    }
    public List<Content> getNobuyList(){
        return contentMapper.getNotbuyContentList();
    }
    public boolean updateContent(Content content,String preImg,HttpServletRequest request )  {
        if(content.getImg()==null&&preImg!=null){
            content.setImg(preImg);
        }
        if(content.getImg()!=preImg){
            File file=new File(request.getServletContext().getRealPath("/image"),preImg);
            if(file.exists()){
                file.delete();
            }
        }
        int i=contentMapper.updateContent(content);
        return i>0;
    }
    public int getMarkByContentId(int contentId){
        return contentMapper.getMarkById(contentId);
    }
    public Content getContentOneView(int contentId) {
        Content content = null;
        int mark = contentMapper.getMarkById(contentId);
        if (mark != 0) {
            System.out.println(mark);
            content = contentMapper.getContentView(contentId);
        } else {
            System.out.println(mark);
            content = contentMapper.getContent(contentId);
        }
        return content;
    }
    public boolean deleteContent(int contentId){
        int i=contentMapper.deleteContent(contentId);
        return i>0;
    }
    public int getSumContent(){
        return contentMapper.getSumContent();
    }
}
