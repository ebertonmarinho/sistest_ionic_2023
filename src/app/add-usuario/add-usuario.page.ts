import { Component, OnInit } from '@angular/core';

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

  constructor() { }

  ngOnInit() {
  }

}
