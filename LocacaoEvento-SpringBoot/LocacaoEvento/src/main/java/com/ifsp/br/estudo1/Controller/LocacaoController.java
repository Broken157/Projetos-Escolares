package com.ifsp.br.estudo1.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ifsp.br.estudo1.model.Evento;

@Controller
public class LocacaoController {
	@GetMapping("/locacao")
	public String exibirFormulario() {
		return "locacao";
	}
	
	@PostMapping("/resultados")
	public String locacao(@RequestParam String txtNome,
	                      @RequestParam int txtConvidados,
	                      @RequestParam int txtHoras,
	                      @RequestParam int txtValorH,
	                      Model model) {

	    Evento locacao = new Evento();
	    locacao.setNomeCliente(txtNome);
	    locacao.setConvidados(txtConvidados);
	    locacao.setHoras(txtHoras);
	    locacao.setValorH(txtValorH);

	    locacao.calcularValorBase();
	    locacao.calcularDesconto();
	    locacao.calcularValorFinal();
	    locacao.tipoEvento();

	    model.addAttribute("nome", locacao.getNomeCliente());
	    model.addAttribute("QuantidadeConvidados", locacao.getConvidados());
	    model.addAttribute("ValorBase", locacao.getValorBase());
	    model.addAttribute("desconto", locacao.getDesconto() * 100);
	    model.addAttribute("ValorFinal", locacao.getValorFinal());
	    model.addAttribute("TipoE", locacao.getTipoE());

	    return "resultados";
	}
	
}
