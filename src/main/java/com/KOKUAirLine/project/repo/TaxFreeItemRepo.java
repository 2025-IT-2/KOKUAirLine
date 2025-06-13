package com.KOKUAirLine.project.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.KOKUAirLine.project.model.TaxFreeItem;

@Repository
public interface TaxFreeItemRepo extends JpaRepository<TaxFreeItem, String> {
	@Query("SELECT t FROM TaxFreeItem t")
	List<TaxFreeItem> getAllItems();

}
