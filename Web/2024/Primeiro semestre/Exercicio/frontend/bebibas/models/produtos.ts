export type CategoriaProduto = {
    id: number;
    nome: string;
}
export type Produto = {
    id: number;
    nome: string;
    preco: number;
    quantidade: number;
    categoriaFK: CategoriaProduto;
    fotos: Array<string>;
}

