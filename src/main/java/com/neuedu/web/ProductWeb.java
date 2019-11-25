package com.neuedu.web;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.neuedu.dao.ProductDao;
import com.neuedu.pojo.Category;
import com.neuedu.pojo.Product;
import com.neuedu.service.CategoryService;
import com.neuedu.service.ProductService;
import com.neuedu.utils.CodeUtils;
import com.neuedu.vo.ProductVo;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import sun.java2d.pipe.SpanIterator;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.security.PublicKey;
import java.util.*;


@Controller
@RequestMapping("/manage/product")
public class ProductWeb {
    @Resource
    private ProductService service;
    @Resource
    private CategoryService categoryService;
    /**
     * 商品列表
     * @return
     */
    @RequestMapping("/prolist.do")
    public String proList(ModelMap map,String pageNum){
        HashMap<String, Object> hashMap = service.selectAll(pageNum);
        List<ProductVo> vos = (List<ProductVo>) hashMap.get("vos");
        System.out.println(vos);
        PageInfo pageInfo = (PageInfo) hashMap.get("pageInfo");
        System.out.println(pageInfo);
        map.addAttribute("provo",vos);
        map.addAttribute("pages", pageInfo);
        return "product_index";
    }

    /**
     * 返回图标json数据
     * @return
     */
    @RequestMapping("/toprolist.do")
    @ResponseBody
    public List<Product> proList(){
        List<Product> products = service.selectAll();
        return products;
    }
    /**
     * 添加商品
     * @return
     */
    @RequestMapping("/addproduct.do")
    public String addProduct(ModelMap map){
        List<Category> categories = categoryService.selectAll();
        map.addAttribute("cag", categories);
        return "product_add";
    }
    @RequestMapping("/do_add.do")
    public String doAddPro(Product product){
        service.insertSelective(product);
        return "redirect:prolist.do";
    }
    /**
     * 单文件上传(这个方法未使用使用下面那个)
     * @param file
     * @param req
     * @return
     */
    @PostMapping("/doFile.do")
    public String doFlie(MultipartFile file, HttpServletRequest req){
        String filename = file.getOriginalFilename();
        String serverpath = req.getServletContext().getRealPath("img");
        System.out.println(filename);
        System.out.println(serverpath);
        System.out.println(filename+"======="+serverpath);
        File path = new File(serverpath);
        if (!path.exists()){
            path.mkdirs();
        }
        String name= UUID.randomUUID()+filename;
        File paths = new File(serverpath+"//"+name);
        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(), paths);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 单文件上传
     * @param file
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/uploadHeadImage", method = { RequestMethod.POST })
    @ResponseBody
    public JSONObject uploadHeadImage(@RequestParam("file") MultipartFile file,  HttpServletRequest request)
            throws IOException {
        Assert.notNull(file, "上传文件不能为空");
        String src="http://127.0.0.1:8080/manage/static/img/";
        String path = request.getSession().getServletContext().getRealPath("static/img");
//        String path="C:/Users/lenove/Desktop/why123/why123/src/main/webapp/plug-in/images/people";
        JSONObject json = new JSONObject();
        //System.currentTimeMillis()根据系统时间产生随机数，保证上传的图片名字不一样
        String str=UUID.randomUUID()+"";
        String name=str+System.currentTimeMillis()+file.getOriginalFilename();
        File dir = new File(path, name);
        src=src+name;
        if (!dir.exists()) {
            dir.mkdirs();
            json.put("msg","上传成功");
            json.put("code",0);
            json.put("src",src);
        } else {
            json.put("msg","上传失败");
            json.put("code",1);
        }
        file.transferTo(dir);
//        System.out.println(json);
        return json;
    }
    /*图片验证码*/
    String strs = null;
    @RequestMapping("/code.do")
    @CrossOrigin
    public void getcode(ModelMap map, HttpServletResponse resp){
        strs = CodeUtils.getStrs();
        BufferedImage img = CodeUtils.getImg(strs);
        try {
            ImageIO.write(img,"jpg",resp.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 验证码校验
     * @return
     */
    @RequestMapping("/codeCheck.do")
    @ResponseBody
    public String codeCheck(String code){
        String s = strs.toLowerCase();
        String s1 = code.toLowerCase();
        if (s.equals(s1)){
            return "1";
        }else {
            return "0";
        }
    }

    /**
     * 修改商品
     * @param id
     * @param map
     * @return
     */
    @RequestMapping("update.do")
    public String toUpdate(Integer id,ModelMap map){
        System.out.println(id);
        Product product = service.selectOneById(id);
        map.addAttribute("prod", product);
        List<Category> categories = categoryService.selectAll();
        map.addAttribute("cag", categories);
        return "product_update";
    }
    @RequestMapping("/update_product.do")
     public String updatePro(Product product){
        System.out.println(product);
        service.updateByPrimaryKeySelective(product);
        return "redirect:prolist.do";
    }

}
