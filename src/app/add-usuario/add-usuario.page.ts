import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Api } from '../../services/api';
import { promises } from 'dns';

@Component({
  selector: 'app-add-usuario',
  templateUrl: './add-usuario.page.html',
  styleUrls: ['./add-usuario.page.scss'],
})
export class AddUsuarioPage implements OnInit {
  
  nome: string = "";
  idusuario: string = "";
  cpf : string = "";
  num_CNH : string = "";
  validade_CNH : string = "";
  telefone : string = "";
  email : string = "";

  constructor(private actRoute:ActivatedRoute, 
    private provider: Api) { }

  ngOnInit() {
     // Act Router para receber e passar parâmetros entre páginas
     this.actRoute.params.subscribe((data:any)=>{
      this.idusuario = "";
      this.nome = data.nome;
      this.cpf = data.cpf;
      this.email = data.email;
      this.num_CNH = data.num_CNH;
      this.validade_CNH = data.validade_CNH;
      this.telefone = data.telefone;
    });
  }
  salvar(){
    return new Promise(resolve => {
      let dados = {
        idusuario : this.idusuario,
        nome : this.nome,
        cpf : this.cpf,
        email : this.email,
        num_CNH : this.num_CNH,
        validade_CNH : this.validade_CNH,
        telefone : this.telefone,
      }
      this.provider.dadosApi(dados, 'inserir.php').subscribe(
        (data : any) => {
          //console.log(data['mensagem']);
          if(data['erro'] == 0){
            //this.mensagemSucesso(data['mensagem']);
            //this.router.navigate(['usuarios']);
            //this.limparCampos();
          }
          if(data['erro'] == 1){
            //this.mensagemErro(data['mensagem']);
          }
        }
      );
    });
  }
}
