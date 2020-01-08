import com.github.pagehelper.PageInfo;
import com.jwh.crud.javabean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "file:src/main/webapp/WEB-INF/springmvc-servlet.xml"})
public class MvcTest {

    //虚拟mvc请求，获取处理结果
    MockMvc mockmvc;
    //传入springMVC的ioc
    @Autowired
    WebApplicationContext context;

    @Before
    public void initMockMvc() {
        mockmvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void main() throws Exception {
        //模拟请求拿到返回值
        MvcResult result = mockmvc.perform(MockMvcRequestBuilders.get("/emps").
                param("pn", "1")).andReturn();
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageinfo = (PageInfo)request.getAttribute("pageInfo");
        System.out.println("当前页码："+pageinfo.getPageNum());
        System.out.println("总页码："+pageinfo.getPages());
        System.out.println("总页码："+pageinfo.getNavigatePages());
        List<Employee> list=new ArrayList<>();
        for (Employee employee : list) {
            System.out.println(employee);
        }
    }
}
