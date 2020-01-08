import com.jwh.crud.dao.DepartmentMapper;
import com.jwh.crud.dao.EmployeeMapper;
import com.jwh.crud.javabean.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Random;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;

    @Test
    public void test() {
        /*departmentMapper.insertSelective(new Department(null,"开发部"));
        departmentMapper.insertSelective(new Department(null,"测试部"));
        departmentMapper.insertSelective(new Department(null,"科研部"));*/

        //执行批量操作
        EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
        String gender = null;
        int n, age, dept;
        for (int i = 0; i < 50; i++) {
            n = new Random().nextInt(2);
            //0~42
            age = new Random().nextInt(20) + 22;
            dept = new Random().nextInt(3) + 1;
            switch (n) {
                case 0:
                    gender = "女";
                    break;
                case 1:
                    gender = "男";
            }

            String uid = UUID.randomUUID().toString();
            employeeMapper.insertSelective(new Employee(null, uid.substring(0, 4), gender, age, uid.substring(0, 8) + "@qq.com", dept));
        }
    }
}
