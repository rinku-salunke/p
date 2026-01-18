package com.example.demo.Controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.demo.Model.Bank;
import com.example.demo.ServiceI.ServiceI;


@Controller
public class BankController {
	
	@Autowired
	ServiceI ssi;

    @RequestMapping("/")
    public String openAccountPage() {
        return "openAccount"; 
    }
 
    @RequestMapping("/saveAccount")
    public String saveAndShowAll(@ModelAttribute Bank b, Model m) {
        ssi.saveAccount(b);
        List<Bank> list = ssi.getAllAccounts(); 
        m.addAttribute("data", list); 
        return "AllAccounts"; 
    }
    
    @RequestMapping("/delete")
    public String deleteAccount(@RequestParam("accNo") long accNo,Model m){
    	List<Bank> list=ssi.deleteAccount(accNo);
    	m.addAttribute("data", list);
		return "AllAccounts";
    	
    }
    
    @RequestMapping("/edit")
    public String editStudent(@RequestParam("accNo") long accNo,Model m){
    Bank b=ssi.editStudent(accNo);
    if(b!=null) {
    	m.addAttribute("bnk",b);
    	return "Edit";
    }
    
    return "AllAccounts";
    }
    
    @RequestMapping("/updateAccount")
    public String updateAccount(@ModelAttribute Bank b,Model m){
    	List<Bank> list=ssi.updateAccount(b);
    	m.addAttribute("data",list);
    	return "AllAccounts";
    }
    
    @RequestMapping("/transactionLogs")
    public String showTransactionLogs(
            @RequestParam(value = "searchQuery", required = false) String accNo,
            @RequestParam(value = "fromDate", required = false) String fromDate,
            @RequestParam(value = "toDate", required = false) String toDate,
            Model model) {
        
        // Fetch filtered results from service
        List<Bank> logs = ssi.getFilteredLogs(accNo, fromDate, toDate);
        
        model.addAttribute("logs", logs);
        return "TransactionLogs"; // Refers to TransactionLogs.jsp
    }

	kk
}
