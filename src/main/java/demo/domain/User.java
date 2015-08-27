package demo.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @NoArgsConstructor @ToString
public class User {
	
	private String id;
	private String password;
	//private int isAutoLogin;
	
	
}
