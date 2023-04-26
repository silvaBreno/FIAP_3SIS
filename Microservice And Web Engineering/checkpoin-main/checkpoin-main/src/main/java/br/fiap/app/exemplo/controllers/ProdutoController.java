package br.fiap.app.exemplo.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.fiap.app.exemplo.models.Categoria;
import br.fiap.app.exemplo.models.Fornecedor;
import br.fiap.app.exemplo.models.Produto;
import br.fiap.app.exemplo.repositories.CategoriaRepository;
import br.fiap.app.exemplo.repositories.FornecedoRepository;
import br.fiap.app.exemplo.repositories.ProdutoRepository;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/produto")
public class ProdutoController {
	
	@Autowired //injeção de dependência
	private ProdutoRepository produtoRepository; 
	
	@Autowired
	private CategoriaRepository categoriaRepository; 
	
	@Autowired
	private FornecedoRepository fornecedorRepository; 
	
	@GetMapping("")
	public ModelAndView get() {
		ModelAndView model = new ModelAndView("produto/index");
		/*	List<Produto> listaProduto = new ArrayList<Produto>();

		Produto produtoUm = new Produto(); 
		produtoUm.setId(new Long(1));
		produtoUm.setNome("Nike Lebrom");
		
		Produto produtoDois = new Produto();
		produtoDois.setId(new Long(2));
		produtoDois.setNome("Nike do Naldo");
		
		listaProduto.add(produtoUm);
		listaProduto.add(produtoDois);*/
		
		List<Produto> listaProduto = produtoRepository.findAll();
		
		model.addObject("produtos", listaProduto);
		return model;
	}
	
	@GetMapping("/edit/{id}")
	public String getById(Model model, @PathVariable("id")Integer idProduto) {
		model.addAttribute("idProduto", idProduto);
		return "produto/edit";
	}
	
	@GetMapping("/create")
	public ModelAndView create() {
		ModelAndView model = new ModelAndView("produto/create");
		List<Categoria> categorias = categoriaRepository.findAll();
		List<Fornecedor> fornecedores = fornecedorRepository.findAll();
		
		model.addObject("fornecedores", fornecedores);
		model.addObject("categorias",categorias);
		return model;
	}
	
	@PostMapping("/create-form")
	public ResponseEntity<Produto> createFrom(@Valid  @RequestBody Produto objProduto) {
		produtoRepository.save(objProduto);
		return new ResponseEntity<Produto>(objProduto, HttpStatus.CREATED);
	}
	
	
	@PostMapping("/create")
	public String create(@ModelAttribute("produto")Produto objProduto) {
		produtoRepository.save(objProduto);
		return "redirect:/produto";
	} 
	
	@GetMapping("/categoria")
	@ResponseBody
	public Categoria getCategoria() {
		Categoria categoria = new Categoria();
		categoria.setDescricao("Outra");
		categoria.setId(1);
		return categoria;
	}
	
	@GetMapping("/categoria/{id}")
	@ResponseBody
	public List<Produto> getProdutoByCategoria(@PathVariable("id")Integer idCategoria){
		List<Produto> produtos = produtoRepository.findByIdCategoria(idCategoria);
		return produtos;
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id")Long id) {
		produtoRepository.deleteById(id);
		return "redirect:/produto";
	}
	
}
