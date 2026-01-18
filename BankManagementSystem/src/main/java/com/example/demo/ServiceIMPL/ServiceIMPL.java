package com.example.demo.ServiceIMPL;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.Model.Bank;
import com.example.demo.Repository.BankRepository;
import com.example.demo.ServiceI.ServiceI;


@Service
public class ServiceIMPL implements ServiceI{

	@Autowired
	BankRepository br;
	
	
	@Override
	public Bank saveAccount(Bank b) {
	return 	br.save(b);
	}


	@Override
	public List<Bank> getAllAccounts() {
		return (List<Bank>) br.findAll();
	}


	@Override
	public List<Bank> deleteAccount(long accNo) {
     br.deleteById(accNo);
		return (List<Bank>) br.findAll();
	}


	@Override
	public Bank editStudent(long accNo) {
    Optional<Bank> op=br.findById(accNo);
    if(op.isPresent()) {
    	Bank b=op.get();
    	return b;
    }
		return null;
	}


	@Override
	public List<Bank> updateAccount(Bank b) {
     br.save(b);
		return (List<Bank>) br.findAll();
	}


	@Override
	public List<Bank> getFilteredLogs(String accNo, String fromDate, String toDate) {
	    // If all filters are empty, return all accounts
	    if ((accNo == null || accNo.isEmpty()) && (fromDate == null || fromDate.isEmpty()) && (toDate == null || toDate.isEmpty())) {
	        return (List<Bank>) br.findAll();
	    }
	    
	    // Call the custom query in the Repository
	    return br.findFilteredAccounts(accNo, fromDate, toDate);
	}

}
