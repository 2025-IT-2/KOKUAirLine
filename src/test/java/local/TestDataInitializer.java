package local;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.KOKUAirLine.project.model.InFlightMeal;
import com.KOKUAirLine.project.repo.InFlightMealRepository;

@SpringBootTest
public class TestDataInitializer {
	@Autowired
    InFlightMealRepository repo;

    @BeforeEach
    void setUp() {
        repo.save(new InFlightMeal("야채식"));
        repo.save(new InFlightMeal("저지방식"));
    }
    
    @Test
    void main() {
    	System.out.println(repo.searchMeal(1) + "\n" + repo.searchMeal(2));
    }
}
