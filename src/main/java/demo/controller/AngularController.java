package demo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import demo.domain.Message;
import demo.repository.MessageRepository;

public class AngularController {
	@Autowired MessageRepository repoMessage;
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	
	@RequestMapping(value="/rest/replies", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<Message> Replies(){
		List<Message> messagies = repoMessage.findAll();
		return messagies;
	}
	
	
	@RequestMapping(value="/angular/reply/write")
	public @ResponseBody Message write(Message message){
		
		message.setDayWriteStr(simpleDateFormat.format(new Date()));
		
		message.setNick("arahansa");
		repoMessage.save(message);
		System.out.println(message);
		return message;
	}
	
	
}
