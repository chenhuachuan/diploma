package com.jz1501.chenhc.diploma.tfbook;

import com.jz1501.chenhc.diploma.tfbook.entity.Book;
import com.jz1501.chenhc.diploma.tfbook.entity.Sort;
import com.jz1501.chenhc.diploma.tfbook.entity.User;
import com.jz1501.chenhc.diploma.tfbook.service.BookService;
import com.jz1501.chenhc.diploma.tfbook.service.CategoryService;
import com.jz1501.chenhc.diploma.tfbook.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;


public class UserTest extends TestTfBookDemo {

    @Autowired
    private UserService userService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private BookService bookService;

    @Test
    public void test1() {
        User dbUser = userService.login("chc123@163.com", "123456");
        System.out.println(dbUser);
    }

    @Test
    public void testPhone() {
      /*  Boolean aBoolean = userService.phoneNumberIsExists("18600791856");
        System.out.println(aBoolean);
*/
        String md5Password = DigestUtils.md5Hex("123456");
        System.out.println("盐：" + md5Password);
        String password = DigestUtils.md5Hex("123456" + md5Password);
        System.out.println("密码：" + password);

        /**
         * 盐：e10adc3949ba59abbe56e057f20f883e
         密码：82790085228cf8a1e3bac41f45271e5f
         */
    }

    @Test
    public void testInsertUser() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = sdf.format(new Date());
        System.out.println(format);


        //String uuid = UUID.randomUUID().toString().replace("-","");
        // User user=new User(uuid,"李白","123456","238ckd@163.com","","",TimeFormatUtil.toSqlDate(new Date()),"男", TimeFormatUtil.toSqlDate("1994-03-15"),"15234345656");
        //userService.regist(user);
    }

    @Test
    public void getUUID() {
        for (int i = 0; i < 5; i++) {

            System.out.println(UUID.randomUUID().toString().replace("-", ""));

        }
    }


    @Test
    public void testBookModel() {
        List<Book> books = bookService.newBookShelves();
        for (Book book : books) {
            System.out.println("图书：" + book.getBookName() + "上架时间" + book.getPublishTime());
        }
    }


    @Test
    public void testQueryAllCategory() {

        List<Sort> sorts = categoryService.queryAllSecondLevelByParentId(2);
        for (Sort sort : sorts) {
            System.out.println("2级分类姓名：=" + sort.getSortName());
            for (Sort son : sort.getSortList()) {
                System.out.println("3级分类名称：===" + son.getSortName());
                /*for (Sort gson : son.getSortList()) {
                    System.out.println("三级分类名称：======="+gson.getSortName());
                }*/
            }
        }
    }

}
