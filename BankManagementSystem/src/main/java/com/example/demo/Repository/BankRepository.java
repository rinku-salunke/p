package com.example.demo.Repository;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Model.Bank;

@Repository
public interface BankRepository extends CrudRepository<Bank,Long> {

	// Adding this @Query fixes the "No property found" error
    @Query("SELECT b FROM Bank b WHERE " +
           "(:accNo IS NULL OR CAST(b.accNo AS string) LIKE %:accNo% OR b.name LIKE %:accNo%)")
    List<Bank> findFilteredAccounts(@RequestParam("accNo") String accNo, 
                                    @RequestParam("fromDate") String fromDate, 
                                    @RequestParam("toDate") String toDate);
}

