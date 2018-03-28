package pl.adamWisniewski.ArchitectureUnitManager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.adamWisniewski.ArchitectureUnitManager.model.Password;
import pl.adamWisniewski.ArchitectureUnitManager.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;

	public List<Password> findAll(){
	     return userRepo.findAll();
	}

}
