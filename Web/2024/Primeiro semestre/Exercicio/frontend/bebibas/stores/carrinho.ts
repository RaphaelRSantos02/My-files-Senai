import type { Produto } from "~/models/produtos";

export type CarrinhoItem = {
    produto: Produto;
    quantidade: number;
}

export type Carrinho = {
    produtos: Array<CarrinhoItem>;    
}

export const carrinho = defineStore('carrinhoStore', {
    state: (): Carrinho => ({
        produtos: []
    }),
    actions: {
      adicionarNoCarrinho(novoProduto: Produto){
        
      }
    }
  })