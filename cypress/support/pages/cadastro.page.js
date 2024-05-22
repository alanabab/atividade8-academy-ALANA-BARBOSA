export default class CadastroPage {
  URL = "https://raromdb-frontend-c7d7dc3305a0.herokuapp.com/register";
  
  inputNome = '[placeholder="Nome"]';
  inputEmail = '[placeholder="E-mail"]';
  inputSenha = '[placeholder="Senha"]';
  inputConfirmarSenha = '[placeholder="Confirmar senha"]';
  
  buttonCadastrar = '.account-save-button';
  buttonOk = '.modal-actions';
  
  janela = '.modal-body';
  alerta = '.input-error';
  barraNav = '.navbar-content';

  typeNome(nome) {
    cy.get(this.inputNome).type(nome);
  }

  typeEmail(email) {
    cy.get(this.inputEmail).type(email);
  }

  typeSenha(senha) {
    cy.get(this.inputSenha).type(senha);
  }

  typeConfirmarSenha(senha) {
    cy.get(this.inputConfirmarSenha).type(senha);
  }

  clickButtonCadastrar() {
    cy.get(this.buttonCadastrar).click();
  }

  clickButtonOk() {
    cy.get(this.buttonOk).click();
  } 

  getJanela() {
    return cy.get(this.janela);
  }
  
  getAlerta() {
    return cy.get(this.alerta);
  }

  getBarraNav(){
    return cy.get(this.barraNav);
  }

  cadastrar(nome, email, senha) {
    this.typeNome(nome);
    this.typeEmail(email);
    this.typeSenha(senha);
    this.typeConfirmarSenha(senha);
    this.clickButtonCadastrar();
  }

  msgSucesso(text) {
    this.getJanela().should('be.visible');
    this.getJanela().should('contain', 'Sucesso');
    this.getJanela().should('contain', text);
  }

  msgErro(text) {
    this.getJanela().should('be.visible');
    this.getJanela().should('contain', 'Falha no cadastro.');
    this.getJanela().should('contain', text);
  }

  CamposObrigatorios() {
    this.getAlerta().should('be.visible');
    this.getAlerta().eq(0).invoke('text').should('equal', "Informe o nome");
    this.getAlerta().eq(1).invoke('text').should('equal', "Informe o e-mail");
    this.getAlerta().eq(2).invoke('text').should('equal', "Informe a senha");
    this.getAlerta().eq(3).invoke('text').should('equal', "Informe a senha");
  }

  navegação() {
    this.getBarraNav().should('contain', 'Perfil');
    this.getBarraNav().should('contain', 'Filmes');
    this.getBarraNav().should('not.contain', 'Login');
  }
}
