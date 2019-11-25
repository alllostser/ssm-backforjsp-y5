package com.neuedu.web;

import com.github.pagehelper.PageInfo;
import com.neuedu.pojo.Category;
import com.neuedu.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/manage/product")
public class CategoryWeb {
    @Resource
    private CategoryService service;

    /**
     * 品类列表
     * @param map
     * @return
     */
    @RequestMapping("/getcategorylist.do")
    public String getProList(ModelMap map,String pageNum){
        PageInfo<Category> pageInfo = service.selectAll(pageNum);
        map.addAttribute("category", pageInfo);
        return "type_index";
    }

    /**
     * 添加品类
     * @return
     */
    @RequestMapping("/addcategory.do")
    public String addCategory(ModelMap map){
        List<Category> list = service.selectAll();
        map.addAttribute("category", list);
        return "type_add";
    }
    @RequestMapping("/doaddcategory.do")
    public String doAddCategory(Category category){
        int insert = service.insert(category);
        return "forward:getcategorylist.do";
    }
    /**
     * 修改品类
     * @param id
     * @param map
     * @return
     */
    @RequestMapping("/to_update.do")
    public String toUpdate(Integer id,ModelMap map){
        List<Category> list = service.selectAll();
        map.addAttribute("category", list);
        Category category = service.selectById(id);
        map.addAttribute("categorybyid",category);
        return "type_update";
    }
    @RequestMapping("/update_category.do")
    public String updateCategory(Category category){
        System.out.println(category);
        int i = service.update(category);
        System.out.println(i);
        return "redirect:getcategorylist.do";
    }


}
