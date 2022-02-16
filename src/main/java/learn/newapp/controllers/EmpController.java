package learn.newapp.controllers;
import learn.newapp.Employee.Emp;

import java.util.ArrayList;
import java.util.List;
import learn.newapp.Database.AddEmployee;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmpController {
    @RequestMapping("/empform")
    public ModelAndView ShowForm(){
        return new ModelAndView("empform");
    }
    @RequestMapping(value="/save", method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute("emp")Emp emp){
        String data = AddEmployee.NewEmployee(emp.getId(), emp.getName(), emp.getSalary(), emp.getDesignation(),
                emp.getDepartment(), emp.getAge());
        if(data.equals("true")){
            return new ModelAndView("redirect:/viewemp");
        }
        return new ModelAndView("redirect:/empform");
    }
    @RequestMapping("/viewemp")
    public  ModelAndView viewemp(){
        List<Emp> list = new ArrayList<Emp>(AddEmployee.GetEmployee());
        return new ModelAndView("viewemp", "list", list);
    }
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    ResponseEntity<String> DeleteEmployee(@RequestBody String id){
        String status = AddEmployee.DeleteEmployee(Integer.parseInt(id));
        if(status.equals("true")){
            return ResponseEntity.status(HttpStatus.OK).body("true");
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("false");

    }

}
