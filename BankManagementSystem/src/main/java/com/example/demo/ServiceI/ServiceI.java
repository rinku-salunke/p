package com.example.demo.ServiceI;
import java.util.List;
import com.example.demo.Model.Bank;

public interface ServiceI {


	Bank saveAccount(Bank b);

	List<Bank> getAllAccounts();

	List<Bank> deleteAccount(long accNo);

	Bank editStudent(long accNo);

	List<Bank> updateAccount(Bank b);

	List<Bank> getFilteredLogs(String accNo, String fromDate, String toDate);

}
