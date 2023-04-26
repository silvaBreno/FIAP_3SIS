package br.fiap.app.exemplo.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import br.fiap.app.exemplo.models.Fornecedor;
import br.fiap.app.exemplo.repositories.FornecedoRepository;

@Controller
@RequestMapping("/fornecedor")
public class FornecedorController {
	
	@Autowired
	private FornecedoRepository fornecedorRepository; 
	
	@GetMapping("")
	public ModelAndView Get() {
		ModelAndView model = new ModelAndView("fornecedor/index");
		List<Fornecedor> listFornecedor = fornecedorRepository.findAll();
		model.addObject("fornecedores", listFornecedor);
		return model; 
	}
	
	@GetMapping("/create")
	public ModelAndView Create() {
		ModelAndView model = new ModelAndView("fornecedor/create");
		return model; 
	}
	
	@PostMapping("/create")
	public String Create(@ModelAttribute("fornecedor")Fornecedor objFornecedor) {
		fornecedorRepository.save(objFornecedor);
		return "redirect:/fornecedor";
	}
	

}
