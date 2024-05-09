import type { Produto } from "./produtos";
import type { Usuario } from "./usuario";

enum PAGAMENTOS {
    'P' = "PENDENTE",
    'A' = "APROVADO",
    'C' = "CANCELADO",
    'R' = "RECUSADO",
}

export type Venda = {
    usuarioFK: Usuario;
    dataHora: string;
    status: PAGAMENTOS
} 


export type VendasProduto = {
    produtoFK: Produto;
    quantidade: number;
    vendaFK: Venda;
}