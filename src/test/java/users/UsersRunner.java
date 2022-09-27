package users;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;

public class UsersRunner {
    //pour ce methode, the Runner must be in the same path of feature.
    @Karate.Test
    Karate testUsers() { return Karate.run("users").relativeTo(getClass());}

    @Karate.Test
    Results testUsers2(){ return Karate.run("classpath:src/test/java/users/users").tags("~@ignore").outputCucumberJson(true).parallel(2);}
    //Results testUsers2(){ return Karate.run("classpath:src/test/java/users/users").tags("@ready").parallel(2);}
}
