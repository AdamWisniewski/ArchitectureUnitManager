package pl.adamWisniewski.ArchitectureUnitManager.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.adamWisniewski.ArchitectureUnitManager.model.Permissions;

@Repository
public interface PermissionRepository extends JpaRepository<Permissions, Long> {

}
