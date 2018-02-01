package com.jk.controller.essay;
import com.jk.pojo.essay.Essay;
import com.jk.service.essay.EssayService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@EnableAutoConfiguration
@RequestMapping("/Essay")
public class EssayController {


    @Autowired
    private EssayService essayService;

    //跳往文章管理页面
    @RequestMapping("/toEssayMain")
    public String toEssayMain(){
        return "essay/essaymain";
    }
    /**
     * 文章列表信息查询
     */
    @RequestMapping("queryEssay")
    @ResponseBody
    public Map<String,Object> queryEssay(Integer pageSize, Integer start, Essay essay){
        Map<String, Object> map=null;

        map=essayService.SelectUserList(pageSize,start,essay);

        return map;
    }

    /**
     * 文章删除
     */
    @RequestMapping("/deleteAll")
    @ResponseBody
    public  Map delEssay(String ids){
        Map a = new HashMap();
        int i=essayService.delEssay(ids);
        a.put("flag",i);
        return a;
    }

    /**
     *创建模态框
     */
  /*  @RequestMapping("/creatDialog")

    public String creatDialog(Essay essay2, HttpServletRequest request){

            Essay essay=essayService.findById(essay2.getEsid());
            request.setAttribute("essay",essay);
            System.out.println(essay);


        return "essay/essay-dialog";
    }
*/
    @RequestMapping("/creatDialog")
    public ModelAndView creatDialog(Essay essay){

        HashMap<String, Object> model=new HashMap<String, Object>();

        if(essay !=null && essay.getEsid()!=null ){
            Essay essay2=essayService.findById(essay.getEsid());
            model.put("essay", essay2);
        }
        //ModelAndView 重定向到新页面,第一个参数是页面路径，第二个是页面内容
        return new ModelAndView("essay/essay-dialog", model);
    }

    /**
     * 增改并用的方法
     * 有id时是修改，没id的时候是新增
     * 记得加上@responseBody
     * @param essay
     */
    @RequestMapping("/AllSubmit")
    @ResponseBody
    public void AllSubmit(Essay essay){
        //判断id是否为null,有id为修改，没id为新增
        //StringUtils.isNotEmpty(essay.getEsid())需要查jar包，自己不会
        System.out.println(essay.toString());
        System.out.println("-------------------------");
       if(essay.getEsid()!=null && essay.getEsid()!=0){
           //修改的方法

           essayService.updateEssay(essay);
           System.out.println(essay.toString());
       }else{
           //新增的方法
       }
    }
}
