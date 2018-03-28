package pl.adamWisniewski.ArchitectureUnitManager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.adamWisniewski.ArchitectureUnitManager.model.Permissions;
import pl.adamWisniewski.ArchitectureUnitManager.repository.PermissionRepository;

@Service
public class PermissionService {
	
	@Autowired
	private PermissionRepository permissionRepo;

	public List<Permissions> findAll(){
	     return permissionRepo.findAll();
	}

}
