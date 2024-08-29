#### UserRepo.java
  
```
package com.datorium.Datorium.API.Repo;

import com.datorium.Datorium.API.DTOs.User;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;


public class UserRepo {

    private ArrayList<User> users = new ArrayList<>(); //Mocked database

    public int add(User user){ // User user is a parameter for a method; User = type and user = name of the  variable I provide in the method
        String url = "jdbc:sqlite:my.db";
        try (var conn = DriverManager.getConnection(url)) {
            if (conn != null) {
                var statement = conn.createStatement();
                statement.execute("INSERT INTO people (name) VALUES ('" + user.name + "')");
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return 0; // to show unsuccessful adding
    }

    public ArrayList<User> get(){
        return users;
    }

    public User update(int userIndex, User updateUserDTO){
       var user = users.get(userIndex);
       user.name = updateUserDTO.name;
       return user;
    }
}
```

#### USerController.java

```
package com.datorium.Datorium.API.Controllers;

import com.datorium.Datorium.API.DTOs.UpdateUserDTO;
import com.datorium.Datorium.API.DTOs.User;
import com.datorium.Datorium.API.Services.UserService;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/user")

public class UserController {
    private UserService userService; //userService is just the name of the variable
    public UserController(){
        userService = new UserService();
        //This code runs first when creating UserController object

    }

    @PostMapping("/add")//localhost:8080/add -> localhost:8080/user/add
    public void add(@RequestBody User user){
        userService.add(user);
    }

    @GetMapping("/get")
    public ArrayList<User> get(){
        return userService.get();
    }

    @PostMapping("/update")
    public User update(@RequestBody UpdateUserDTO updateUserDTO){
        return userService.update(updateUserDTO.userIndex, updateUserDTO.user);
    }

}
```

#### UserService.java

```
package com.datorium.Datorium.API.Services;

import com.datorium.Datorium.API.DTOs.User;
import com.datorium.Datorium.API.Repo.UserRepo;

import java.util.ArrayList;


public class UserService {
    private UserRepo userRepo;

    public UserService(){
        userRepo = new UserRepo();
    }

    public int add(User user){
        return userRepo.add(user);
    }

    public ArrayList<User> get(){
        return userRepo.get();
    }

    public User update(int userIndex, User updateUserDTO){
        return userRepo.update(userIndex, updateUserDTO);
    }
}
```

#### User.java

```
package com.datorium.Datorium.API.DTOs;

public class User {
    public String name;
}
```

#### Postman, POST

#### my.db
![image](https://github.com/user-attachments/assets/c9e64341-265d-4d34-be81-6a061dae24ad)

