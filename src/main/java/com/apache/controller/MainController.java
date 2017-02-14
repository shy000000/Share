package com.apache.controller;
import com.apache.Result;
import com.apache.model.AdEntity;
import com.apache.model.EssayEntity;
import com.apache.model.UserEntity;
import com.apache.repository.AdRepository;
import com.apache.repository.EssayRepository;
import com.apache.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


/**
 * Created by shy on 2016/3/16.
 */
@Controller
public class MainController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    AdRepository adRepository;

    @Autowired
    EssayRepository essayRepository;

    /**
     * 进入平台
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(HttpServletRequest request,ModelMap modelMap) {
        String uid = request.getParameter("id");

        if(!userIsExist(uid)){
            return "indexFail";
        }else{
            UserEntity userEntity = userRepository.findOne(Integer.parseInt(uid));
            String turn = parseState(userEntity,"index");
            modelMap.addAttribute("uid",uid);
            modelMap.addAttribute("username",userEntity.getName());
            return turn;
        }
    }

    /**
     * 分享
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/front/share",method = RequestMethod.GET)
    public String essayShare(HttpServletRequest request,ModelMap modelMap)throws Exception{

        String url = request.getParameter("url");
        final String weiChatUrl = "weixin.qq.com";
        if(url.indexOf(weiChatUrl) != -1){
//            modelMap.addAttribute("url","https://www.baidu.com/");
            String title = new String();

            modelMap.addAttribute("url",url);
            String filepath = "E:\\web\\Share\\target\\springmvcdemo\\WEB-INF\\pages";
            downloadByNet(url,filepath,"page.jsp");
            File pageFile = new File(filepath+"/page.jsp");

            String pageString = flieToString(pageFile);

            //添加图片
            //下载图片保存至本地
            String storageFolder = "E:\\web\\Share\\target\\springmvcdemo\\WEB-INF\\images";

            String pageString2 = new String();
            //
            if(pageString.indexOf("preview.html") != -1){
                pageString2 = pageString.replace("preview.html","player.html");
            }else{
                pageString2 = pageString;
            }
            Document document = Jsoup.parse(pageString2);
            //title
            Elements title1 = document.select("title");
            title = title1.text();

            Element iframeClone = document.head();
            if (pageString2.indexOf("vid=") != -1){
                Elements iframe = document.select("iframe");
                iframeClone = iframe.first().clone();
            }
            Elements img = document.select("img[data-src]");
            int count = 0;
            String[] urlArray = new String[img.size()];
            for(Element src : img){
                String imagesPath = src.attr("data-src");
                urlArray[count] = imagesPath;
                downloadByNet(imagesPath,storageFolder,""+count);
                //循环修改page中的图片的路径
                src.attr("data-src","../images/"+count);
                count++;
            }
            String midpage =  document.toString();

            //处理cover图片
            //搜索“cover”，从这里开始截取两个引号间的内容。，为cover图片的url；
            int cover = midpage.indexOf("cover");
            int left = midpage.indexOf("\"",cover);
            int right = midpage.indexOf("\"",left+1);
            String coverUrl = midpage.substring(left+1,right);
            downloadByNet(coverUrl,storageFolder,"cover");
            String midpage2 = null;
            if(midpage.indexOf(coverUrl) != -1){
                midpage2 = midpage.replace(coverUrl, "../images/cover");
            }

//            String midpage = pageString.replaceAll("data-backsrc","src");
            String newPage = midpage2.replaceAll("data-src","src");

            if(pageString2.indexOf("vid=") != -1){
                Document doc = Jsoup.parse(newPage);
                Elements iframes = doc.select("iframe");
//            Element iframe1 = iframes.first();
//            iframe1 = iframeClone.clone();
                for(Element src : iframes){
                    String imagesPath = iframeClone.attr("data-src");
                    String datasrc = imagesPath.split("&")[0];
                    src.attr("src",datasrc);
                    src.attr("height","300");
                    src.attr("width","100%");
                    src.attr("class","");
                    src.attr("scrolling","");
                    src.attr("style","");
                }
                newPage = doc.toString();
            }
            //隐藏公众号
            StringBuffer page = new StringBuffer(newPage);
            String weiChatKey = "rich_media_meta_list";
            String hiddenUser = " hidden ";
            int num = newPage.indexOf(weiChatKey);
            num = num-7;
            page.insert(num,hiddenUser);


            System.out.println(page);
            modelMap.addAttribute("page",page);

            String uidStirng = request.getParameter("uid");
            int uid = Integer.parseInt(uidStirng);
            UserEntity userEntity = userRepository.findOne(uid);
            AdEntity adEntity = adRepository.findOne(uid);

            //
            //用户文章数量加一
            userEntity.setEssaycount(userEntity.getEssaycount()+1);
            userRepository.saveAndFlush(userEntity);
            //返回用户广告
            modelMap.addAttribute("ad",adEntity);
            //文章
            EssayEntity essayEntity = new EssayEntity();
            essayEntity.setUid(uid);
            essayEntity.setSrc(url);
            essayEntity.setLookcount(0);
            essayEntity.setSharetime(new Timestamp(System.currentTimeMillis()));
            essayEntity.setTitle(title);
            essayRepository.saveAndFlush(essayEntity);

            modelMap.addAttribute("username",userEntity.getName());

            return "wocao";
        }else{
            modelMap.addAttribute("url",url);

            return "result";
        }

    }

    /**
     * 美文广场
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/front/allessay",method = RequestMethod.GET)
    public String getAllEssay(HttpServletRequest request,ModelMap modelMap){
        return null;
    }

    /**
     * 我的文章
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/front/myessay",method = RequestMethod.GET)
    public String getMyEssay(HttpServletRequest request,ModelMap modelMap){
        String uid = request.getParameter("uid");
        if(!userIsExist(uid)){
            return "indexFail";
        }else{
            UserEntity userEntity = userRepository.findOne(Integer.parseInt(uid));
            //判断用户状态
            String turn = parseState(userEntity ,"MyEssay");

            modelMap.addAttribute("uid",uid);
            modelMap.addAttribute("username",userEntity.getName());
            modelMap.addAttribute("essaycount",userEntity.getEssaycount());
            modelMap.addAttribute("lookcount",userEntity.getLookcount());
            modelMap.addAttribute("deadline",userEntity.getDeadline());
            return turn;
        }

    }

    /**
     * 我的
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/front/my",method = RequestMethod.GET)
    public String getMy(HttpServletRequest request,ModelMap modelMap){
        String uid = request.getParameter("uid");

        if(!userIsExist(uid)){
            return "indexFail";
        }else{
            UserEntity userEntity = userRepository.findOne(Integer.parseInt(uid));
            //判断用户状态
            String turn = parseState(userEntity ,"myinfo");

            modelMap.addAttribute("uid",uid);
            modelMap.addAttribute("username",userEntity.getName());
            modelMap.addAttribute("essaycount",userEntity.getEssaycount());
            modelMap.addAttribute("lookcount",userEntity.getLookcount());
            modelMap.addAttribute("deadline",userEntity.getDeadline());
            return turn;
        }
    }

    @RequestMapping(value = "/front/input1",method = RequestMethod.GET)
    public String counter1(HttpServletRequest request,ModelMap modelMap){
        modelMap.addAttribute("output"," ");
        return "counter";
        }
    @RequestMapping(value = "/front/input2",method = RequestMethod.GET)
    public String counter2(ModelMap modelMap){
        modelMap.addAttribute("output"," ");
        return "counter2";
    }
    @RequestMapping(value = "/front/input3",method = RequestMethod.GET)
    public String counter3(ModelMap modelMap){
        modelMap.addAttribute("output"," ");
        return "counter3";
    }
    //表1计算
    @RequestMapping(value = "/front/counter1",method = RequestMethod.POST)
    public String counters1 (HttpServletRequest request,ModelMap modelMap){

        List<Integer> input = new ArrayList<Integer>();
        Integer index = 1;
        String temp = request.getParameter("input");
        if (temp.length()!=70){
            modelMap.addAttribute("output","输入错误");
            return "counter";
        }
        for(int i = 0;i< 70;i++){
            char fir = temp.charAt(i);
            String ss = String.valueOf(fir);
            Integer xx = Integer.parseInt(ss);
            input.add(xx);
            index++;
        }
        //反向
        input.set(4,6-input.get(4));
        input.set(7,6-input.get(7));
        input.set(8,6-input.get(8));
        input.set(12,6-input.get(12));
        input.set(13,6-input.get(13));
        input.set(15,6-input.get(15));
        input.set(17,6-input.get(17));
        input.set(18,6-input.get(18));
        input.set(21,6-input.get(21));
        input.set(24,6-input.get(24));
        input.set(26,6-input.get(26));
        input.set(27,6-input.get(27));
        input.set(31,6-input.get(31));
        input.set(36,6-input.get(36));
        input.set(37,6-input.get(37));
        input.set(38,6-input.get(38));
        input.set(41,6-input.get(41));
        input.set(42,6-input.get(42));
        input.set(44,6-input.get(44));
        input.set(45,6-input.get(45));
        input.set(48,6-input.get(48));
        input.set(51,6-input.get(51));
        input.set(53,6-input.get(53));
        input.set(54,6-input.get(54));
        input.set(55,6-input.get(55));
        input.set(56,6-input.get(56));
        input.set(60,6-input.get(60));
        input.set(62,6-input.get(62));
        input.set(63,6-input.get(63));
        input.set(67,6-input.get(67));
        //计算
        Result result = new Result();
        Integer ph = input.get(0)+input.get(1)+input.get(12)+input.get(13)+input.get(24)+input.get(25)+input.get(36)+input.get(37)+input.get(48)+input.get(49)+input.get(60)+input.get(61);
        result.setPH(ph);
        Integer me = input.get(2)+input.get(3)+input.get(14)+input.get(15)+input.get(26)+input.get(27)+input.get(38)+input.get(39)+input.get(50)+input.get(51)+input.get(62)+input.get(63);
        result.setME(me);
        Integer per = input.get(4)+input.get(5)+input.get(16)+input.get(17)+input.get(28)+input.get(29)+input.get(40)+input.get(41)+input.get(52)+input.get(53)+input.get(64)+input.get(65);
        result.setPER(per);
        Integer fa = input.get(6)+input.get(7)+input.get(18)+input.get(19)+input.get(30)+input.get(31)+input.get(42)+input.get(43)+input.get(54)+input.get(55)+input.get(66)+input.get(67);
        result.setFA(fa);
        Integer so =  input.get(8)+input.get(9)+input.get(20)+input.get(21)+input.get(32)+input.get(33)+input.get(44)+input.get(45)+input.get(56)+input.get(57)+input.get(68)+input.get(69);
        result.setSO(so);
        Integer sc =  input.get(10)+input.get(11)+input.get(22)+input.get(23)+input.get(34)+input.get(35)+input.get(46)+input.get(47)+input.get(58)+input.get(59);
        result.setSC(sc);
        Integer id = 0;
        for(int i = 0;i<24;i++){
            id = id+input.get(i);
        }
        result.setID(id);
        Integer sa=0;
        for(int i = 24;i<48;i++){
            sa = sa+input.get(i);
        }
        result.setSA(sa);
        Integer b = 0;
        for (int i = 48;i<70;i++){
            b=b+input.get(i);
        }
        result.setB(b);
        Integer tot = id+sa+b;
        result.setTOT(tot);
        String output = ph.toString()+","+me.toString()+","+per.toString()+","+fa.toString()+","+so.toString()+","+sc.toString()+","+id.toString()+","+sa.toString()+","+b.toString()+","+tot.toString();
        System.out.println(output);
        modelMap.addAttribute("output",output);
        try {
            FileOutputStream fos = new FileOutputStream("E:\\结果.csv",true);
            fos.write(output.getBytes());
            fos.close();
        }catch (IOException e){
            System.out.println(e);

        }
        return "counter";
    }
    //表二计算
    @RequestMapping(value = "/front/counter2",method = RequestMethod.POST)
    public String counters2(HttpServletRequest request,ModelMap modelMap){
        List<Integer> input = new ArrayList<Integer>();
        String temp = request.getParameter("input");
        if (temp.length()!=19){
            modelMap.addAttribute("output","输入错误");
            return "counter2";
        }
        for(int i = 0;i< 19;i++){
            char fir = temp.charAt(i);
            String ss = String.valueOf(fir);
            Integer xx = Integer.parseInt(ss);
            input.add(xx);
        }
        //反向
        input.set(1,6-input.get(1));
        input.set(2,6-input.get(2));
        input.set(3,6-input.get(3));
        input.set(5,6-input.get(5));
        input.set(6,6-input.get(6));
        input.set(7,6-input.get(7));
        input.set(8,6-input.get(8));
        input.set(9,6-input.get(9));
        input.set(11,6-input.get(11));
        input.set(12,6-input.get(12));
        input.set(14,6-input.get(14));
        input.set(15,6-input.get(15));
        input.set(16,6-input.get(16));
        input.set(17,6-input.get(17));
        input.set(18,6-input.get(18));
        //计算
        Integer a1 = input.get(6)+input.get(8)+input.get(9)+input.get(15)+input.get(16)+input.get(17);
        Integer a2 = input.get(11)+input.get(12)+input.get(13);
        Integer a3 = input.get(1)+input.get(2)+input.get(5);
        Integer a4 = input.get(3)+input.get(7)+input.get(18);
        Integer a5 = input.get(0)+input.get(4)+input.get(10)+input.get(14);
        Integer a6 = a1 + a2+a3+a4+a5;
        String output = a1.toString()+","+a2.toString()+","+a3.toString()+","+a4.toString()+","+a5.toString()+","+a6.toString();
        System.out.println(output);
        modelMap.addAttribute("output",output);
        try {
            FileOutputStream fos = new FileOutputStream("E:\\结果2.csv",true);
            fos.write(output.getBytes());
            fos.close();
        }catch (IOException e){
            System.out.println(e);

        }
        return "counter2";
    }

    //表三计算
    @RequestMapping(value = "/front/counter3",method = RequestMethod.POST)
    public String counters3(HttpServletRequest request,ModelMap modelMap){
        List<Integer> input = new ArrayList<Integer>();
        String temp = request.getParameter("input");
        if (temp.length()!=36){
            modelMap.addAttribute("output","输入错误");
            return "counter";
        }
        for(int i = 0;i< 36;i++){
            char fir = temp.charAt(i);
            String ss = String.valueOf(fir);
            Integer xx = Integer.parseInt(ss);
            input.add(xx);
        }
        //反向
        input.set(2,8-input.get(2));
        input.set(3,8-input.get(3));
        input.set(8,8-input.get(8));
        input.set(9,8-input.get(9));
        //计算
        Integer a1 = input.get(0)+input.get(6)+input.get(12)+input.get(18)+input.get(24)+input.get(30)+input.get(34);
        Integer a2 = input.get(1)+input.get(7)+input.get(13)+input.get(19)+input.get(25)+input.get(31)+input.get(35);
        Integer a3 = input.get(2)+input.get(8)+input.get(14)+input.get(20)+input.get(26)+input.get(32);
        Integer a4 = input.get(5)+input.get(11)+input.get(17)+input.get(23)+input.get(29)+input.get(33);
        Integer a5 = input.get(4)+input.get(10)+input.get(16)+input.get(22)+input.get(28);
        Integer a6 = input.get(3)+input.get(9)+input.get(15)+input.get(21)+input.get(27);
        Integer a7 = a1+a2+a3+a4+a5+a6;
        String output = a1.toString()+","+a2.toString()+","+a3.toString()+","+a4.toString()+","+a5.toString()+","+a6.toString()+","+a7.toString();
        System.out.println(output);
        modelMap.addAttribute("output",output);
        try {
            FileOutputStream fos = new FileOutputStream("E:\\结果3.csv",true);
            fos.write(output.getBytes());
            fos.close();
        }catch (IOException e){
            System.out.println(e);

        }
        return "counter3";
    }
    /**
     * 判断用户状态
     * @param userEntity
     * @param pass
     * @return
     */
    public static String parseState(UserEntity userEntity,String pass){
        Integer state = userEntity.getState();
        if(state == -1){
            //该用户已被注销
            return "indexFail";
        }
        if(state == 0){
            //用户已到期
            String string = "您的服务时间已到期，请缴费";
            return "indexFail";
        }else{
            return pass;
        }
    }

    /**
     * 判断用户是否存在
     * @param uid
     * @return
     */
    public boolean userIsExist(String uid){
        UserEntity userEntity = null;
        try {
            userEntity = userRepository.findOne(Integer.parseInt(uid));
        }catch (Exception e){
            System.out.println(e);
        }
        if(null == userEntity){
            return false;
        }else {
            return true;
        }
    }





    /**
     * 文件转成字符串
     * @param file
     * @return
     */
    public static String flieToString(File file){
        String result = "";
        try{
            InputStreamReader isr = new InputStreamReader(new FileInputStream(file), "UTF-8");
            BufferedReader br = new BufferedReader(isr);//构造一个BufferedReader类来读取文件
            String s = null;
            while((s = br.readLine())!=null){//使用readLine方法，一次读一行
                result = result + "\n" +s;
            }
            br.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 下载网页内容
     * @param imgSrc
     * @param filePath
     * @param fileName
     */
    public static void downloadByNet(String imgSrc,String filePath,String fileName){
        try{
            URL url = new URL(imgSrc);
            URLConnection conn = url.openConnection();
            //设置超时间为100秒
            conn.setConnectTimeout(100*1000);
            //防止屏蔽程序抓取而返回403错误
            conn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
            //输出流
            InputStream str = conn.getInputStream();

            //控制流的大小为1k
            byte[] bs = new byte[1024*100];

            //读取到的长度
            int len = 0;

            //是否需要创建文件夹
            File saveDir = new File(filePath);
            if(!saveDir.exists()){
                System.out.println("ok");
                saveDir.mkdir();
            }
            File file = new File(saveDir+File.separator+fileName);
            System.out.println(file.getAbsolutePath());

            //实例输出一个对象
            FileOutputStream out = new FileOutputStream(file);
            //循环判断，如果读取的个数b为空了，则is.read()方法返回-1，具体请参考InputStream的read();
            while ((len = str.read(bs)) != -1) {
                //将对象写入到对应的文件中
                out.write(bs, 0, len);
            }

            //刷新流
            out.flush();
            //关闭流
            out.close();
            str.close();

            System.out.println("下载成功");

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
