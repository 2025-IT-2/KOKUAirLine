package com.KOKUAirLine.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.KOKUAirLine.project.model.InFlightMeal;

@Repository
public interface InFlightMealRepository extends JpaRepository<InFlightMeal, Integer> {
	@Query("SELECT m FROM InFlightMeal m WHERE "
			+ "m.mealNo = :mealNo")
	InFlightMeal searchMeal(int mealNo);
}
