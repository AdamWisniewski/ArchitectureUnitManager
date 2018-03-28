package pl.adamWisniewski.ArchitectureUnitManager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.adamWisniewski.ArchitectureUnitManager.model.Password;
import pl.adamWisniewski.ArchitectureUnitManager.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private UserService userService;


	@Autowired
	public AdminController(UserService userService) {
		super();
		this.userService = userService;
	}

	@GetMapping("/displayUsers")
	public String dispUsers(Model model) {
		List<Password> casesList = userService.findAll();
		model.addAttribute("usersList", casesList);
		return "/admin/displayUsers";
	}

}
