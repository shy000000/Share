package com.apache.controller;

import com.apache.MD5Util;
import com.apache.Page;
import com.apache.model.AdEntity;
import com.apache.model.AdminEntity;
import com.apache.model.UserEntity;
import com.apache.repository.AdRepository;
import com.apache.repository.AdminRepository;
import com.apache.repository.EssayRepository;
import com.apache.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by shy on 2016/3/17.
 */
@Controller
public class BackController {
    @Autowired
    AdminRepository adminRepository;
    @Autowired
    AdRepository adRepository;
    @Autowired
    EssayRepository essayRepository;
    @Autowired
    UserRepository userRepository;

    /**
     * 跳转到登陆界面
     * @return
     */
    @RequestMapping(value = "/loggedin")
    public String loggedin(){
        return "back/Login";
    }

    /**
     * 过滤用get方式访问/back/loggedin的方法
     * @param modelMap
     * @param request
     * @return
     */
    @RequestMapping(value = "/back/loggedin",method = RequestMethod.GET)
    public String loggdeinB(ModelMap modelMap,HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("user") == null){
            return "back/Login";
        }else{
            Object username = session.getAttribute("user");
            if(username.toString().equals("yunlong")){
                modelMap.addAttribute("semaphore","3");//超管理员登陆信号
            }
            modelMap.addAttribute("username",username.toString());
            return "back/backman";
        }
    }

    /**
     * 登陆
     * @param modelMap
     * @param request
     * @return
     */
    @RequestMapping(value = "/back/loggedin",method = RequestMethod.POST)
    public String loggdeinByGet(ModelMap modelMap,HttpServletRequest request){
        final String ADMIN = "yunlong";
        String username = request.getParameter("username");
        String passwordTemp = request.getParameter("password");
        String password = passwordTemp;

        if(!username.equals(ADMIN)) {
            password = MD5Util.MD5(passwordTemp);
        }
        AdminEntity adminEntity = new AdminEntity();
        try{
            adminEntity = adminRepository.findByUsername(username);
        }catch (Exception e){
            System.out.println(e);
        }
        /**
         * 判断是否有此人
         */
        if(null == adminEntity){
            modelMap.addAttribute("semaphore","0");//无此人，登录失败
            modelMap.addAttribute("key",username);
            return "back/Login";//返回登陆界面
        }else{
            //判断密码是否正确
            if(password.equals(adminEntity.getPassword())){
                //正确
                HttpSession session = request.getSession();
                modelMap.addAttribute("username",username);//返回用户名
                //设置session
                session.setAttribute("user",username);
                if(username.equals("yunlong")){
                    modelMap.addAttribute("semaphore","3");//超管理员登陆信号
                }
                return "back/backman";
            }else{
                //不正确
                modelMap.addAttribute("semaphore","0");//密码错误,登录失败
                return "back/Login";
            }
        }
    }

    /**
     * 注销
     * @param request
     * @return
     */
    @RequestMapping(value = "/back/loggedout",method = RequestMethod.GET)
    public String loggedout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "back/Login";
    }

    /**
     * 添加管理员跳转
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/back/addAdmin",method = RequestMethod.GET)
    public String addUser(HttpServletRequest request,ModelMap modelMap){
        HttpSession session = request.getSession();
        String user = session.getAttribute("user").toString();
        if(!user.equals("yunlong")){
            modelMap.addAttribute("username",user);

            return "back/backman";
        }
        modelMap.addAttribute("semaphore","3");//超管理员登陆信号
        modelMap.addAttribute("username",user);
        return"back/addAdmin";
    }

    /**
     * 添加管理员
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/back/addAdminPost",method = RequestMethod.POST)
    public String addUserPost(HttpServletRequest request,ModelMap modelMap){

        HttpSession session = request.getSession();
        String user = session.getAttribute("user").toString();
        if(!user.equals("yunlong")){

            modelMap.addAttribute("username",user);
            return "back/backman";
        }
        modelMap.addAttribute("semaphore","3");//超管理员登陆信号
        modelMap.addAttribute("username",user);

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AdminEntity usersEntity = new AdminEntity();
        try{
            usersEntity = adminRepository.findByUsername(username);
        }catch (Exception e){
            System.out.println(e);
        }
        if(null == usersEntity){
            AdminEntity add = new AdminEntity();
            String temp = MD5Util.MD5(password);
            add.setUsername(username);
            add.setPassword(temp);
            adminRepository.saveAndFlush(add);
            modelMap.addAttribute("hasname","0");
            return "back/addAdmin";
        }else {
            modelMap.addAttribute("hasname","1");
            return "back/addAdmin";
        }
    }

    /**
     * 所有用户列表
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/back/allAdmin",method = RequestMethod.GET)
    public String userManage(HttpServletRequest request,ModelMap modelMap){
        HttpSession session = request.getSession();
        String user = session.getAttribute("user").toString();
        if(!user.equals("yunlong")){

            modelMap.addAttribute("username",user);
            return "back/backman";
        }
        modelMap.addAttribute("semaphore","3");//超管理员登陆信号
        modelMap.addAttribute("username",user);

        String pageNow = request.getParameter("pageNow");
        List<AdminEntity> usersEntities = new ArrayList<AdminEntity>();
        List<AdminEntity> UsersEntityRes = new ArrayList<AdminEntity>();
        try{
            usersEntities = adminRepository.findAll();
        }catch (Exception e){
            System.out.println(e);
        }
        if(usersEntities.size()==0){
            modelMap.addAttribute("admins","0");
        }else{
            Integer totalCount = usersEntities.size();
            Page page = null;

            Integer startPos = 0;
            Integer pageSize = 5;
            Integer endPos = 5;
            if(endPos > totalCount) endPos=totalCount;
            if(pageNow != null && !"1".equals(pageNow)) {

                page = new Page(totalCount, Integer.parseInt(pageNow));
                startPos = page.getStartPos();
                pageSize = page.getPageSize();
                endPos = startPos+pageSize;
                if(endPos > totalCount) endPos=totalCount;
                if(endPos == startPos){
                    page.setPageNow(Integer.parseInt(pageNow) - 1);
                    startPos = page.getStartPos();
                    pageSize = page.getPageSize();
                    endPos = startPos+pageSize;
                    if(endPos > totalCount) endPos=totalCount;
                }
                for(int i = startPos;i<endPos;i++){
                    UsersEntityRes.add(usersEntities.get(i));
                }
            }else{
                page = new Page(totalCount, 1);
                for(int i = 0;i<endPos;i++){
                    UsersEntityRes.add(usersEntities.get(i));
                }
            }
            modelMap.addAttribute("page",page);
            modelMap.addAttribute("admins",UsersEntityRes);
        }

        return "back/adminManage";
    }

    /**
     * 删除用户
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/back/deleteAdmin" ,method = RequestMethod.GET)
    public String deleteUser(HttpServletRequest request,ModelMap modelMap){

        HttpSession session = request.getSession();
        String user = session.getAttribute("user").toString();
        if(!user.equals("yunlong")){
            modelMap.addAttribute("username",user);
            return "back/backman";
        }
        modelMap.addAttribute("semaphore","3");//超管理员登陆信号
        modelMap.addAttribute("username",user);

        String deleteUserId = request.getParameter("userid");
        String pageNow = request.getParameter("pageNow");
        modelMap.addAttribute("pageNow",pageNow);
        AdminEntity usersEntity = adminRepository.findOne(Integer.parseInt(deleteUserId));
        adminRepository.delete(usersEntity);


        List<AdminEntity> usersEntities = new ArrayList<AdminEntity>();
        List<AdminEntity> UsersEntityRes = new ArrayList<AdminEntity>();
        try{
            usersEntities = adminRepository.findAll();
        }catch (Exception e){
            System.out.println(e);
        }
        if(usersEntities.size()==0){
            modelMap.addAttribute("admins","0");
        }else{
            Integer totalCount = usersEntities.size();
            Page page = null;

            Integer startPos = 0;
            Integer pageSize = 5;
            Integer endPos = 5;
            if(endPos > totalCount) endPos=totalCount;
            if(pageNow != null && !"1".equals(pageNow)) {

                page = new Page(totalCount, Integer.parseInt(pageNow));
                startPos = page.getStartPos();
                pageSize = page.getPageSize();
                endPos = startPos+pageSize;
                if(endPos > totalCount) endPos=totalCount;
                if(endPos == startPos){
                    page.setPageNow(Integer.parseInt(pageNow) - 1);
                    startPos = page.getStartPos();
                    pageSize = page.getPageSize();
                    endPos = startPos+pageSize;
                    if(endPos > totalCount) endPos=totalCount;
                }
                for(int i = startPos;i<endPos;i++){
                    UsersEntityRes.add(usersEntities.get(i));
                }
            }else{
                page = new Page(totalCount, 1);
                for(int i = 0;i<endPos;i++){
                    UsersEntityRes.add(usersEntities.get(i));
                }
            }
            modelMap.addAttribute("page",page);
            modelMap.addAttribute("admins",UsersEntityRes);
        }

        return "back/adminManage";
    }

    /**
     * 添加用户跳转
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/back/addUser" , method = RequestMethod.GET)
    public String newUser(HttpServletRequest request,ModelMap modelMap){
        HttpSession session = request.getSession();
        String user = session.getAttribute("user").toString();
        if(user.equals("yunlong")){
            modelMap.addAttribute("semaphore","3");//超管理员登陆信号
        }
        modelMap.addAttribute("username",user);
        return "back/addUser";

    }

    /**
     * 添加用户
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/back/addUserPost",method = RequestMethod.POST)
    public String addWantedPost(HttpServletRequest request , ModelMap modelMap,@RequestParam("picture1") MultipartFile[] files){
        HttpSession session = request.getSession();
        String user = session.getAttribute("user").toString();
        if(user.equals("yunlong")){
            modelMap.addAttribute("semaphore","3");//超管理员登陆信号
        }
        modelMap.addAttribute("username",user);

        //获取非图片参数
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Integer day = Integer.parseInt(request.getParameter("day"));
        String word = request.getParameter("word");
        Timestamp cometime = new Timestamp(System.currentTimeMillis());
        Date tomorrow = new java.util.Date( (new java.util.Date()).getTime()+86400000*day);
        java.sql.Date date=new java.sql.Date(tomorrow.getTime());
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = sdf.format(date);
        Timestamp deadline = Timestamp.valueOf(dateStr);
        Integer essaycount = 0;
        Integer lookcount = 0;

        String picture1 = new String();
        String picture2 = new String();
        String turn1 = new String();
        String turn2 = new String();
        //set user
        UserEntity userEntity = new UserEntity();
        try {
            userEntity = userRepository.findByName(name);
        }catch (Exception e){
            System.out.println(e);
        }
        if(null == userEntity){
            UserEntity add = new UserEntity();

            add.setName(name);
            add.setCometime(cometime);
            add.setEssaycount(essaycount);
            add.setPhone(phone);
            add.setAddress(address);
            add.setDeadline(deadline);
            add.setLookcount(lookcount);
            add.setState(1);
            AdEntity addAd = new AdEntity();
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
            //  获得第1张图片（根据前台的name名称得到上传的文件）
//            MultipartFile imgFile1 =  multipartRequest.getFile("picture1");
//            MultipartFile imgFile2  =  multipartRequest.getFile("picture2");
//            MultipartFile imgTurn1  =  multipartRequest.getFile("turn1");
//            MultipartFile imgTurn2  =  multipartRequest.getFile("turn2");
            List<MultipartFile> multipartFiles = multipartRequest.getFiles("picture1");
            MultipartFile imgFile1 =  multipartFiles.get(0);
            MultipartFile imgFile2  = multipartFiles.get(1);
            MultipartFile imgTurn1  =  multipartFiles.get(2);
            MultipartFile imgTurn2  =  multipartFiles.get(3);
            //定义一个数组，用于保存可上传的文件类型
            List fileTypes = new ArrayList();
            fileTypes.add("jpg");
            fileTypes.add("jpeg");
            fileTypes.add("bmp");
            fileTypes.add("gif");
            fileTypes.add("png");
            //保持村第一张图片
            if(!(imgFile1.getOriginalFilename() ==null || "".equals(imgFile1.getOriginalFilename()))) {
                String imgname= "picture1";
                File file1 = this.getFile(imgFile1,name,imgname,fileTypes);
                picture1 = file1.getPath();
                addAd.setPicture1(picture1);
            }else{
                picture1 = "无";
                addAd.setPicture1(picture1);


            }
            if(!(imgFile2.getOriginalFilename() ==null || "".equals(imgFile2.getOriginalFilename()))){
                String imgname= "picture2";
                File file1 = this.getFile(imgFile2,name,imgname,fileTypes);
                picture2 = file1.getPath();
                addAd.setPicture2(picture2);
            }else {
                picture2 = "无";
                addAd.setPicture2(picture2);
            }
            if(!(imgTurn1.getOriginalFilename() ==null || "".equals(imgTurn1.getOriginalFilename()))){
                String imgname= "turn1";
                File file1 = this.getFile(imgTurn1,name,imgname,fileTypes);
                turn1 = file1.getPath();
                addAd.setTurn1(turn1);
            }else{
                turn1 = "无";
                addAd.setTurn1(turn1);
            }
            if(!(imgTurn2.getOriginalFilename() ==null || "".equals(imgTurn2.getOriginalFilename()))){
                String imgname= "turn2";
                File file1 = this.getFile(imgTurn2,name,imgname,fileTypes);
                turn2 = file1.getPath();
                addAd.setTurn2(turn2);
            }else {
                turn2 = "无";
                addAd.setTurn1(turn2);
            }
            addAd.setWord(word);
            userRepository.saveAndFlush(add);
            UserEntity userEntity1 = userRepository.findByName(name);
            addAd.setId(userEntity1.getId());
            adRepository.saveAndFlush(addAd);
            modelMap.addAttribute("haveuser","0");
            return "back/addUser";

        }else{
            modelMap.addAttribute("haveuser", "1");
            return "back/addUser";
        }

    }

    /**
     * 注销用户跳转
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/back/outUser",method = RequestMethod.GET)
    public String outUser(HttpServletRequest request,ModelMap modelMap){
        HttpSession session = request.getSession();
        String user = session.getAttribute("user").toString();
        if(user.equals("yunlong")){
            modelMap.addAttribute("semaphore","3");//超管理员登陆信号
        }
        modelMap.addAttribute("username",user);

        String pageNow = request.getParameter("pageNow");
        List<UserEntity> usersEntities = new ArrayList<UserEntity>();
        List<UserEntity> userEntities = new ArrayList<UserEntity>();
        List<UserEntity> UsersEntityRes = new ArrayList<UserEntity>();
        try{
            usersEntities = userRepository.findAll();
        }catch (Exception e){
            System.out.println(e);
        }
        if(usersEntities.size()==0){
            modelMap.addAttribute("users","0");
        }else{
            Timestamp time = new Timestamp(System.currentTimeMillis());
            for(int i = 0;i<usersEntities.size();i++){
                if(time.after(usersEntities.get(i).getDeadline()) && usersEntities.get(i).getState() ==1){
                    userEntities.add(usersEntities.get(i));
                    usersEntities.get(i).setState(-1);
                    userRepository.saveAndFlush(usersEntities.get(i));
                }

            }




            Integer totalCount = userEntities.size();
            Page page = null;

            Integer startPos = 0;
            Integer pageSize = 5;
            Integer endPos = 5;
            if(endPos > totalCount) endPos=totalCount;
            if(pageNow != null && !"1".equals(pageNow)) {

                page = new Page(totalCount, Integer.parseInt(pageNow));
                startPos = page.getStartPos();
                pageSize = page.getPageSize();
                endPos = startPos+pageSize;
                if(endPos > totalCount) endPos=totalCount;
                if(endPos == startPos){
                    page.setPageNow(Integer.parseInt(pageNow) - 1);
                    startPos = page.getStartPos();
                    pageSize = page.getPageSize();
                    endPos = startPos+pageSize;
                    if(endPos > totalCount) endPos=totalCount;
                }
                for(int i = startPos;i<endPos;i++){
                    UsersEntityRes.add(userEntities.get(i));
                }
            }else{
                page = new Page(totalCount, 1);
                for(int i = 0;i<endPos;i++){
                    UsersEntityRes.add(userEntities.get(i));
                }
            }
            if(userEntities.size() ==0){
                modelMap.addAttribute("users","0");
            }else {
                modelMap.addAttribute("users",UsersEntityRes);
            }
            modelMap.addAttribute("page",page);
        }


        return "back/outUser";
    }

    /**
     * 注销用户
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/back/outUserGet",method = RequestMethod.GET)
    public String outUserGet(HttpServletRequest request,ModelMap modelMap){
        HttpSession session = request.getSession();
        String user = session.getAttribute("user").toString();
        if(user.equals("yunlong")){
            modelMap.addAttribute("semaphore","3");//超管理员登陆信号
        }
        modelMap.addAttribute("username",user);

        String pageNow = request.getParameter("pageNow");
        List<UserEntity> usersEntities = new ArrayList<UserEntity>();
        List<UserEntity> userEntities = new ArrayList<UserEntity>();
        List<UserEntity> UsersEntityRes = new ArrayList<UserEntity>();
        try{
            usersEntities = userRepository.findAll();
        }catch (Exception e){
            System.out.println(e);
        }
        if(usersEntities.size()==0){
            modelMap.addAttribute("users","0");
        }else{
            Timestamp time = new Timestamp(System.currentTimeMillis());
            for(int i = 0;i<usersEntities.size();i++){
                if(time.after(usersEntities.get(i).getDeadline()) && usersEntities.get(i).getState() ==1){
                    userEntities.add(usersEntities.get(i));
                    usersEntities.get(i).setState(-1);
                    userRepository.saveAndFlush(usersEntities.get(i));
                }

            }


            Integer totalCount = userEntities.size();
            Page page = null;

            Integer startPos = 0;
            Integer pageSize = 5;
            Integer endPos = 5;
            if(endPos > totalCount) endPos=totalCount;
            if(pageNow != null && !"1".equals(pageNow)) {

                page = new Page(totalCount, Integer.parseInt(pageNow));
                startPos = page.getStartPos();
                pageSize = page.getPageSize();
                endPos = startPos+pageSize;
                if(endPos > totalCount) endPos=totalCount;
                if(endPos == startPos){
                    page.setPageNow(Integer.parseInt(pageNow) - 1);
                    startPos = page.getStartPos();
                    pageSize = page.getPageSize();
                    endPos = startPos+pageSize;
                    if(endPos > totalCount) endPos=totalCount;
                }
                for(int i = startPos;i<endPos;i++){
                    UsersEntityRes.add(userEntities.get(i));
                }
            }else{
                page = new Page(totalCount, 1);
                for(int i = 0;i<endPos;i++){
                    UsersEntityRes.add(userEntities.get(i));
                }
            }
            if(userEntities.size() ==0){
                modelMap.addAttribute("users","0");
            }else {
                modelMap.addAttribute("users",UsersEntityRes);
            }
            modelMap.addAttribute("page",page);

        }

        return "back/outUser";
    }

    /**
     * 所有用户列表
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/back/allUser",method = RequestMethod.GET)
    public String allUser(HttpServletRequest request,ModelMap modelMap){


        HttpSession session = request.getSession();
        String user = session.getAttribute("user").toString();
        if(user.equals("yunlong")){
            modelMap.addAttribute("semaphore","3");//超管理员登陆信号
        }
        modelMap.addAttribute("username",user);

        String pageNow = request.getParameter("pageNow");
        List<UserEntity> usersEntities = new ArrayList<UserEntity>();
        List<UserEntity> UsersEntityRes = new ArrayList<UserEntity>();
        try{
            usersEntities = userRepository.findAll();
        }catch (Exception e){
            System.out.println(e);
        }
        if(usersEntities.size()==0){
            modelMap.addAttribute("users","0");
        }else{
            Integer totalCount = usersEntities.size();
            Page page = null;

            Integer startPos = 0;
            Integer pageSize = 5;
            Integer endPos = 5;
            if(endPos > totalCount) endPos=totalCount;
            if(pageNow != null && !"1".equals(pageNow)) {

                page = new Page(totalCount, Integer.parseInt(pageNow));
                startPos = page.getStartPos();
                pageSize = page.getPageSize();
                endPos = startPos+pageSize;
                if(endPos > totalCount) endPos=totalCount;
                if(endPos == startPos){
                    page.setPageNow(Integer.parseInt(pageNow) - 1);
                    startPos = page.getStartPos();
                    pageSize = page.getPageSize();
                    endPos = startPos+pageSize;
                    if(endPos > totalCount) endPos=totalCount;
                }
                for(int i = startPos;i<endPos;i++){
                    UsersEntityRes.add(usersEntities.get(i));
                }
            }else{
                page = new Page(totalCount, 1);
                for(int i = 0;i<endPos;i++){
                    UsersEntityRes.add(usersEntities.get(i));
                }
            }
            if(usersEntities.size() ==0){
                modelMap.addAttribute("users","0");
            }else {
                modelMap.addAttribute("users",UsersEntityRes);
            }
            modelMap.addAttribute("page",page);

        }

        return "back/allUser";
    }

    /**
     * 修改用户跳转
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/back/updateUser",method = RequestMethod.GET)
    public String updateUser(HttpServletRequest request,ModelMap modelMap){
        return null;
    }

    /**
     * 用户详细
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/back/detailUser",method = RequestMethod.GET)
    public String detailUser(HttpServletRequest request,ModelMap modelMap){
        HttpSession session = request.getSession();
        String user = session.getAttribute("user").toString();
        if(user.equals("yunlong")){
            modelMap.addAttribute("semaphore","3");//超管理员登陆信号
        }
        modelMap.addAttribute("username",user);

        String wantedmanId = request.getParameter("userid");
        UserEntity wantedmanEntity = userRepository.findOne(Integer.parseInt(wantedmanId));
        AdEntity adEntity = adRepository.findOne(Integer.parseInt(wantedmanId));
        String picture1 = adEntity.getPicture1();
        String picture2 = adEntity.getPicture2();
        String turn1 = adEntity.getTurn1();
        String turn2 = adEntity.getTurn2();
        if(!picture1.equals("无")){
            String[] array=picture1.split("\\.");

            String photoPath = "../../images/"+wantedmanEntity.getName()+"/"+"picture1"+"."+array[1];
            adEntity.setPicture1(photoPath);
        }
        if(!picture2.equals("无")){
            String[] array=picture2.split("\\.");

            String photoPath = "../../images/"+wantedmanEntity.getName()+"/"+"picture2"+"."+array[1];
            adEntity.setPicture2(photoPath);
        }
        if(!turn1.equals("无")){
            String[] array=turn1.split("\\.");

            String photoPath = "../../images/"+wantedmanEntity.getName()+"/"+"turn1"+"."+array[1];
            adEntity.setTurn1(photoPath);
        }
        if(!turn2.equals("无")){
            String[] array=turn2.split("\\.");

            String photoPath = "../../images/"+wantedmanEntity.getName()+"/"+"turn2"+"."+array[1];
            adEntity.setTurn2(photoPath);
        }
        modelMap.addAttribute("wantedman",wantedmanEntity);
        modelMap.addAttribute("ad",adEntity);
        String pageNow = request.getParameter("pageNow");
        modelMap.addAttribute("pageNow",pageNow);
        return "back/detailUser";
    }

    /**
     * 文件上传辅助方法
     * @param imgFile 从页面中读取到的文件
     * @param brandName 身份证号
     * @param fileTypes 允许的文件拓展名集合
     * @return
     */
    private File getFile(MultipartFile imgFile,String brandName,String fileName,List fileTypes) {
        String fileName1 = imgFile.getOriginalFilename();
        //获取上传文件类型的扩展名,先得到.的位置，再截取从.的下一个位置到文件的最后，最后得到扩展名
        String ext = fileName1.substring(fileName1.lastIndexOf(".")+1,fileName1.length());
        //对扩展名进行小写转换
        ext = ext.toLowerCase();
        fileName = fileName +"."+ext;
        File file = null;
        if(fileTypes.contains(ext)) {
            //如果扩展名属于允许上传的类型，则创建文件
            file = this.creatFolder( brandName, fileName);
            try {
                imgFile.transferTo(file);                   //保存上传的文件
            }catch (IllegalStateException e){
                e.printStackTrace();
            }catch (IOException e){
                e.printStackTrace();
            }
        }
        return file;
    }

    private File creatFolder(String brandName,String fileName) {
        File file = null;
        brandName = brandName.replaceAll("/", "");             //去掉"/"
        brandName = brandName.replaceAll(" ", "");             //替换半角空格
        brandName = brandName.replaceAll(" ", "");             //替换全角空格

        File firstFolder = new File("e:/" + "web/Share/src/main/webapp/WEB-INF/images");
        File firstFolder1 = new File("E:/web/Share/target/springmvcdemo/WEB-INF/images");

        File secondFolder1 = new File(firstFolder1,brandName);
        File secondFolder = new File(firstFolder,brandName);
        if(secondFolder.exists()) {                        //如果二级文件夹也存在，则创建件
            file = new File(secondFolder,fileName);
        }else {                                           //如果二级文件夹不存在，则创建二级文件夹
            secondFolder.mkdir();
            file = new File(secondFolder,fileName);        //创建完二级文件夹后，再合建文件
        }
        if(secondFolder1.exists()) {                        //如果二级文件夹也存在，则创建件
            file = new File(secondFolder1,fileName);
        }else {                                           //如果二级文件夹不存在，则创建二级文件夹
            secondFolder1.mkdir();
            file = new File(secondFolder1,fileName);        //创建完二级文件夹后，再合建文件
        }

        return file;
    }


}
