package com.KOKUAirLine.project.repo;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.KOKUAirLine.project.model.TaxFreeItem;

@Repository
public interface TaxFreeItemRepo extends JpaRepository<TaxFreeItem, Integer> {

}
