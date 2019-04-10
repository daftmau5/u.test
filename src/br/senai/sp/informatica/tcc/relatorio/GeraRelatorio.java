package br.senai.sp.informatica.tcc.relatorio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;

public class GeraRelatorio {
	// M�todo para realizar a conex�o com o banco de dados
		public Connection getConexao() throws SQLException, ClassNotFoundException {
			Class.forName("org.postgresql.Driver");
			Connection conexao = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "12345");
			return conexao;
			
		}
	 
		public byte[] gerarPDF(String diretorio, long id) {
			byte[] retorno = null;
			String relatorio = diretorio + "Cherry.jrxml";
	
			try {
				// Faz a compila��o do relat�rio
				JasperReport jasperReport = JasperCompileManager.compileReport(relatorio);
	 
				// Cria o mapa de par�metros que ser� enviado ao relat�rio
				HashMap<String, Object> paramatros = new HashMap<String, Object>();
				paramatros.put("idEvento",id);
	 
 
				// Preenche os dados do relat�rio
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, paramatros, getConexao());
	 
				// Objeto para a ser retornado
				retorno = JasperRunManager.runReportToPdf(jasperReport, paramatros, getConexao());
	
			} catch (Exception e) {
				e.printStackTrace();
			}
			return retorno;
		}
	}

