package demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.domain.Message;

public interface MessageRepository extends JpaRepository<Message, Long>{
	
}
