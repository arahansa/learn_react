package demo.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data @NoArgsConstructor @ToString
public class Message {

	@Id
	@GeneratedValue
	private Long replyId;
	
	private String nick;
	private String msg;
	private String dayWriteStr;
	
	
	

}
